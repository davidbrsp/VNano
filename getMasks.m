function finalMask = getMasks(axesHandle, Rois)

  imHandle = imhandles(axesHandle);
  nRois = size(Rois, 2);
  imMask = zeros([size(imHandle.CData) nRois]);
%  imMask = zeros([size(imHandle.CData) 1]);
  k = 0;
  
  for i = 1 : nRois
    if Rois{i}.isvalid
      k = k + 1;
      imMask(:, :, k) = createMask(Rois{i}, imHandle);
%      imMask(:, :, k) = createMask(Rois{i}, imHandle);
    end
  end
  finalMask = imMask(:,:,(1:k));
%  finalMask = sum(imMask,3);
%  finalMask = logical(finalMask > 0);
end