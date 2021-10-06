function x = LU_Brahinets(A, b)
  n = length(b);
  
  for k = 1:n
    l(k,k) = 1;
    
    for j = k:n
      sum = 0;
      
      for s = 1:k-1
          sum = sum + l(k,s) * u(s,j);
      end
      
      u(k,j) = A(k,j) - sum;
    end
    
    for i = k+1:n
      sum = 0;
      
      for s = 1:k-1
          sum = sum + l(i,s) * u(s,k);
      end
      
      l(i,k) =(A(i,k) - sum) / u(k,k);
    end
  end
   
  z(1) = b(1);

  for i = 2:n
    sum = 0;
    
    for j = 1:i-1
      sum = sum + l(i,j) * z(j);
    end
    
    z(i) = b(i) - sum;
  end
  
  x(n) = z(n) / u(n,n);
  
  for i = n-1:-1:1
    sum = 0;
    
    for j = i+1:n
      sum = sum + u(i,j) * x(j);
    end
    
    x(i) = (z(i) - sum) / u(i,i);
  end
 end