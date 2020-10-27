function value = applyRoiFunc(func, image, mask)
  fn = str2func(func);
%  value = fn(handles.dicomStruct{1}{2}(logical(handles.RoisMasks(:,:,1))));
  value = fn(double(image(logical(mask))));
end