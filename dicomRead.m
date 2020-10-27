function dicomStruct = dicomRead(dicomDirectory)
  dicomDirectoryList = dir(dicomDirectory);
  %dicomImgPath = strcat(dicomDirectory, '/', dicomDirectoryList(dicomImgSlice).name);
  
  % http://www.mathworks.com/matlabcentral/fileexchange/22161-waitbar-with-time-estimation/content/waitbar.m
  h = waitbar(0, 'Please wait...');
  dicomStruct = {};
  dirSize = size(dicomDirectoryList, 1);
  for i = 3:dirSize
    dicomImgPath = strcat(dicomDirectory, '/', dicomDirectoryList(i).name);
    dicomInfo = dicominfo(dicomImgPath);
    dicomRead = dicomread(dicomInfo);
    dicomStruct{end + 1} = {dicomInfo dicomRead};
    waitbar(i / dirSize, h, sprintf('Reading: %s', dicomDirectoryList(i).name));
  end
  close(h) 
  
%  T = get(h,'tightinset');
%  set(h,'position',[T(1) T(2) 1-T(1)-T(3) 1-T(2)-T(4)]);

%   set(h,'Box', 'on');

%  gca = tempGca;
  
end