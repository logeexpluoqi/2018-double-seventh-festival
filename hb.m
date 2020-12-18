function y=hb(x) 
 [m n]=size(x); 
 for i=1:m     
  for j=1:n      
     if rem(x(i,j),2*pi)>=0&&rem(x(i,j),2*pi)<0.5*pi  
        y(i,j)=sin(2*x(i,j)-0.5*pi)+1;   
     elseif rem(x(i,j),2*pi)>=0.5*pi&&rem(x(i,j),2*pi)<1.5*pi          
        y(i,j)=2;     
     elseif rem(x(i,j),2*pi)>=1.5*pi&&rem(x(i,j),2*pi)<2*pi     
        y(i,j)=-cos(2*x(i,j))+1 ;        
     end      
   end     
  end  
end 