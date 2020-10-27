function showMask(image, mask)
  imshow(imadjust(image .* uint16(mask), [0 100/2547], []))
%  imshow(imadjust(handles.dicomStruct{1}{2}.*uint16(handles.RoisMasks(:,:,2)),[0 100/2547],[]))
end