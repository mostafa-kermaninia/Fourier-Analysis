[y, fs] = audioread('ABITW.mp3');
%sound(y, fs);
fprintf('Original sound Sampling Rate: %dHz\n', fs);

audiowrite('D:\uni\semester 4\ريضمو\CAs\CA1\double.wav', y, fs*2);
[y, fs_new] = audioread('double.wav');
%sound(y, fs_new);
fprintf('Doubled sound Sampling Rate: %dHz\n', fs_new);

audiowrite('D:\uni\semester 4\ريضمو\CAs\CA1\half.wav', y, fs/2);
[y, fs_new] = audioread('half.wav');
sound(y, fs_new);
fprintf('Halfed sound Sampling Rate: %dHz\n', fs_new);
