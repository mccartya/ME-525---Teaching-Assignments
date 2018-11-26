function objectiveFunction(numberClassSectionsFall, teachingAssignmentsFall, numberClassSectionsSpring, teachingAssignmentsSpring, professorInfo)

objectiveFunctionValue = 0;

%Fall Classes
for i = 1:size(numberClassSectionsFall, 1)  %for each class listed
   for j = 1:numberClassSectionsFall(i,2) %for each section in each class
       profNumber = teachingAssignmentsFall(i,j);
       profPriority = professorInfo(profNumber,1);
       
       %Determine if the class was one of the professor's preferences
       profPreference = 0;
       if isequal(numberClassSectionsFall(i,1), professorInfo(profNumber,4)) %1st choice
                profPreference = 3;
       elseif isequal(numberClassSectionsFall(i,1), professorInfo(profNumber,5)) %2nd choice
                profPreference = 2;
       elseif isequal(numberClassSectionsFall(i,1), professorInfo(profNumber,6)) %3rd choice
                profPreference = 1;
       end 
       for k = 7:9 %Not preferred
            if isequal(numberClassSectionsFall(i,1), professorInfo(profNumber,k))
                profPreference = -3;
            end
       end
       
       %Determine if the professor has previously taught the class
       previouslyTaught = 0;
       for k = 10:17
            if isequal(numberClassSectionsFall(i,1), professorInfo(profNumber,k))
                previouslyTaught = 2;
            end
       end
       
      %Update objective function value
      objectiveFunctionValue = objectiveFunctionValue + profPriority*(profPreference + previouslyTaught);
   end
end

%Spring Classes
for i = 1:size(numberClassSectionsSpring, 1)  %for each class listed
   for j = 1:numberClassSectionsSpring(i,2) %for each section in each class
       profNumber = teachingAssignmentsSpring(i,j);
       profPriority = professorInfo(profNumber,1);
       
       %Determine if the class was one of the professor's preferences
       profPreference = 0;
       if isequal(numberClassSectionsSpring(i,1), professorInfo(profNumber,4)) %1st choice
                profPreference = 3;
       elseif isequal(numberClassSectionsSpring(i,1), professorInfo(profNumber,5)) %2nd choice
                profPreference = 2;
       elseif isequal(numberClassSectionsSpring(i,1), professorInfo(profNumber,6)) %3rd choice
                profPreference = 1;
       end 
       for k = 7:9 %Not preferred
            if isequal(numberClassSectionsSpring(i,1), professorInfo(profNumber,k))
                profPreference = -3;
            end
       end
       
       %Determine if the professor has previously taught the class
       previouslyTaught = 0;
       for k = 10:17
            if isequal(numberClassSectionsSpring(i,1), professorInfo(profNumber,k))
                previouslyTaught = 2;
            end
       end
       
      %Update objective function value
      objectiveFunctionValue = objectiveFunctionValue + profPriority*(profPreference + previouslyTaught);
   end
end

end