function appliedRoiStruct = applyRoiMask(axesHandle, dicomStruct, Rois)

  nRois = size(Rois, 2);
%  imMask = zeros([size(dicomStruct{1}{2}) 0]);
  
  appliedRoiStruct = cell(nRois, size(dicomStruct, 2));
  
%  zeros([nRois size(dicomStruct, 2) size(dicomStruct{1}{2})]);
  k = 1;
  
%  appliedRoiMatrix = {};
%  appliedRoiStruct = {};  

  imHandle = imhandles(axesHandle);
  for i = 1 : nRois
    if Rois{i}.isvalid
%      imMask(:, :, end + 1) = 
      mask = uint16(createMask(Rois{i}, imHandle));
%      appliedRoiStruct{end + 1} = {};
      for j = 1:size(dicomStruct)
%          appliedRoiStruct(k,j,:,:) = mask .* uint16(dicomStruct{j}{2});
        appliedRoiStruct{k}{j} = uint16(mask) .* uint16(dicomStruct{j}{2});
      end
      k =+ 1;
%      appliedRoiStruct{end+1} = {tempMask};
    end
  end

%  for i = 1:size(Rois)
%  end

end