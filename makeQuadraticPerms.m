function makeQuadraticPerms
rowIdx = 1;

for i = -4:4
   if i == 0
       i = i + 1;
   end
   for j = -4:4
      for k = -4:4
            perm{rowIdx,1} = i;
            perm{rowIdx,2} = j;
            perm{rowIdx,3} = k;
            rowIdx = rowIdx+1;
       
      end
   end
end

    writecell(perm,'quadraticTimeTestXL.xlsx','Sheet','Permutations');
end