function makeCubicPerms
rowIdx = 1;

for i = -3:3
   if i == 0
       i = i + 1;
   end
   for j = -3:3
      for k = -3:3
         for m = -3:3
            perm{rowIdx,1} = i;
            perm{rowIdx,2} = j;
            perm{rowIdx,3} = k;
            perm{rowIdx,4} = m;
            rowIdx = rowIdx+1;
         end
      end
   end
end

    writecell(perm,'cubicTimeTestXL.xlsx','Sheet','Permutations');
end