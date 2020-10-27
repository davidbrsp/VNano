function SD = linearSD(xData, yData, A, B)

  t1 = yData - A - (B * xData)
  t2 = t1.^2
  N = double(size(xData, 2))
  delta = N * sum(xData.^2) - sum(xData)^2
  
  sigma = sum(t2) / (N - 2.)
  sigmaB = sigma * (N / delta)
  SD = sqrt(sigmaB)
end
