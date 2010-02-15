function [R, actual] = testcase(n)
% TESTCASE Generate test data for GPS exercise.

% TESTCASE(n) returns a 4x4 matrix R and a vector 'actual'; each row
% of R is information from one satellite (as described in the assignment)
% and 'actual' is 4 entry vector with information about the receiver;
% specifically, actual(1:3) is the receiver's position, and actual(4) is
% receiver's clock error (a positive value means the receiver's clock is fast).
% 'actual' is provided so that you can determine whether your code is
% working correctly.

% For n=0, a random example is generated.
% n=1,2,3 were generated randomly *once*, but are now hardcoded.  This will
% aid in debugging since various information will be provided about thse
% special cases.

if (n == 1)
  R = [   8.2159e-02  -6.2013e-04   3.3144e-02   9.5870e-02
  -5.9266e-03  -7.5009e-02   4.6771e-02   1.1269e-01
   1.5581e-02  -5.4645e-02   6.7972e-02   1.0448e-01
  -1.9100e-02   4.1093e-02   7.6129e-02   1.0789e-01];
  actual = [   0.0156493
   0.0016272
   0.0142698
   0.0266976
];
elseif (n == 2)
    R =[   0.0428020   0.0223120  -0.0742911   0.0463952
  -0.0179367   0.0843352   0.0203682   0.0468564
   0.0072632   0.0740298   0.0481232   0.0402185
   0.0185242   0.0605598   0.0619546   0.0379434];
    actual = [  0.0185643
   0.0084977
   0.0059290
  -0.0385375
];
elseif (n == 3)
    R = [  -4.6533e-02  -5.8792e-02   4.7193e-02   6.7735e-02
  -1.0971e-02  -8.7909e-02  -7.6134e-04   7.0069e-02
  -6.7146e-02  -5.7303e-02   7.5407e-03   5.9865e-02
  -4.6872e-02  -7.5180e-02   2.8938e-04   6.2648e-02];
    actual = [  -0.0188709
  -0.0081815
  -0.0051778
  -0.0101711
];
elseif (n == 4)
R = [   0.0850490  -0.0243697   0.0046682   0.0357262
   0.0513613  -0.0717093  -0.0082942   0.0313859
   0.0659658  -0.0093046   0.0584033   0.0294173
   0.0135703  -0.0674114   0.0558619   0.0213816];
actual = zeros(4,1);

else

ls = 299792458; %meters in a light-second
r = 6360e3 / ls; %radius of Earth, in light-seconds

% Create random position, near surface of Earth.
dist = r + randn*5e3 / ls;
actual = randn(3,1);
actual = dist*actual/norm(actual); %Rescale to roughly 6500 km to origin.

% Create random positions of 4 satellites, visible to receiver.
orbitrad = 26560e3 / ls; %radius of satellite orbits is 26560km
satellite_positions = zeros(3,4);
for s = 1:4
  % Generate random positions until we get a visible satellite.
  % Our random positions are visible almost 50% of the time.
  invisible = 1;
  while (invisible)
    pos = randn(3,1); %random position
    pos = pos*orbitrad/norm(pos); %rescaled to be 26560km from Earth's center
    invisible = ((pos - actual)'*actual < 0); %Is satellite below horizon?
  end
  satellite_positions(:,s) = pos;
end

% Now we have to do receiving times.
% Since we are using light-seconds for distance, the distances to the
% satellites are equal to the delays before we receive the message.
distances = sqrt(sum((satellite_positions - actual*ones(1,4)).^2));

%Generate a random clock error in the receiver.
%We will take to be in the interval [-0.05,0.05].
%Bear in mind that the GPS receiver receives messages from satellites
%between 0.06 and 0.09 seconds after they are sent, and those messages
%have times in them, so setting our clock by assuming the delay was 0.075
%seconds will leave us accurate to 0.015 seconds.

rxclockerror = 0.1*(rand-0.5);
actual(4) = rxclockerror;

R = zeros(4);
R(:,1:3) = satellite_positions';
R(:,4) = distances + rxclockerror;

end
