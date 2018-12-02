function [pointMatrix] = objectiveFunctionEntries(numberClassSections, professorInfo)
% This helper function to findTeachingAssignments makes a matrix of point values 
% to put in the objective function where each row is a teacher and the first column 
% lists their professor number and each following column represents a class

pointMatrix = zeros(size(professorInfo, 1), size(numberClassSections,1)+1);

for i = 1:size(professorInfo, 1)  %for each professor listed
   for j = 1:size(numberClassSections,1) %for each class listed
       %find their professor number and assign in to the first column in the point matrix
       profNumber = professorInfo(i,1);
       pointMatrix(i,1) = profNumber;
       
       profPriority = professorInfo(i,2);
       
       %Determine if the class was one of the professor's preferences
       profPreference = 0;
       if isequal(numberClassSections(j,1), professorInfo(i,4)) %1st choice
                profPreference = 3;
       elseif isequal(numberClassSections(j,1), professorInfo(i,5)) %2nd choice
                profPreference = 2;
       elseif isequal(numberClassSections(j,1), professorInfo(i,6)) %3rd choice
                profPreference = 1;
       end 
       for k = 7:9 %Not preferred
            if isequal(numberClassSections(j,1), professorInfo(i,k))
                profPreference = -3;
            end
       end
       
       %Determine if the professor has previously taught the class
       previouslyTaught = 0;
       for k = 10:17
            if isequal(numberClassSections(i,1), professorInfo(i,k))
                previouslyTaught = 2;
            end
       end
       
      %Update objective function value
      pointMatrix(i,j+1) = profPriority*(profPreference + previouslyTaught);
   end
end

end