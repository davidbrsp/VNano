function dicomShow(axesHandle, dicomStruct, dicomImgSlice, isShowed)
  if isShowed
    imHandle = imhandles(axesHandle);
    imHandle.CData = imadjust(dicomStruct{dicomImgSlice}{2});
  else
    hold off;
%    imshow(imadjust(dicomStruct{dicomImgSlice}{2}), 'Parent', axesHandle, 'Border', 'tight', 'XData', [0 1], 'YData', [0 1]);
    imshow(imadjust(dicomStruct{dicomImgSlice}{2}), 'Parent', axesHandle);
    axis(axesHandle, 'equal');
  end
end