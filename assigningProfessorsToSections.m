function [teachingAssignments, objFunctionValue] = assigningProfessorsToSections(numberClassSections, pointMatrix, startingNumber, availableTeachers)
% This helper function to findTeachingAssignments assigns a professor to
% each section given a professor to start the search

objFunctionValue = 0;
currentProfessorAvailability = availableTeachers;
largestNumberOfSections = max(numberClassSections(:,2)); 
teachingAssignments = zeros(size(numberClassSections, 1), largestNumberOfSections);

%Designate the order to search the professors
professorSearchOrder = zeros(1,size(pointMatrix,1));
searchOrderIndex = 1;
for i = startingNumber:(size(pointMatrix,1)) %first add from starting number to the end of the list
    professorSearchOrder(1,searchOrderIndex) = i;
    searchOrderIndex = searchOrderIndex + 1;
end
for i = 1:(startingNumber-1) %then add from 1 to just before the starting number
    professorSearchOrder(1,searchOrderIndex) = i;
    searchOrderIndex = searchOrderIndex + 1;
end

for i = 1:size(numberClassSections, 1)  %for each class listed
   for j = 1:numberClassSections(i,2) %for each section in each class
       %initialize current best values
       tempObjFunctionEntry = -5;
       tempProfessorLine = 0;
       
       %check the objective function value for class i for each professor
       for k = 1:size(professorSearchOrder,2)
           %Find the objective function entry for this professor teaching this class
           currentTeacherClassEntry = pointMatrix(professorSearchOrder(k), i+1);
           
           %Check to see if this professor had a higher objective function
           %entry than current most and has a teaching opening
           if (tempObjFunctionEntry < currentTeacherClassEntry && currentProfessorAvailability(professorSearchOrder(k),2) ~= 0) 
                 %set the current best to this professor
                 tempProfessorLine = professorSearchOrder(k);
                 tempObjFunctionEntry = currentTeacherClassEntry;
           end
            
       end
       %Update teaching assignments with the best option  
       teachingAssignments(i,j) = pointMatrix(tempProfessorLine, 1); %Assign entry to professor number
       currentProfessorAvailability(tempProfessorLine,2) = currentProfessorAvailability(tempProfessorLine,2) - 1; %reduce the number of classes the professor can still teach
       objFunctionValue = objFunctionValue - tempObjFunctionEntry; %update objective function value
   end
end
end