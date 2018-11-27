function [teachingAssignmentsFall, teachingAssignmentsSpring] = assigningProfessorsToSections(numberClassSectionsFall, numberClassSectionsSpring, professorInfo)

largestNumberOfSections = 10;
teachingAssignmentsFall = zeros(size(numberClassSectionsFall, 1), largestNumberOfSections);
teachingAssignmentsSpring = zeros(size(numberClassSectionsFall, 1), largestNumberOfSections);

%Fall Assignments
for i = 1:size(numberClassSectionsFall, 1)  %for each class listed
   for j = 1:numberClassSectionsFall(i,2) %for each section in each class
        profNumber = 0;
        profPriority = 0;
        %Check to see if any professors requested the class as first preference
        for k = 1:size(professorInfo, 1) %for each professor
            if isequal(numberClassSectionsFall(i,1), professorInfo(profNumber,4)) %1st choice
                if (profPriority < professorInfo(profNumber,1)) %check to see if new professor has higher priority than the current professor
                    profNumber = k;
                    profPriority = professorInfo(profNumber,1);
                end
            end
        end
        
        if (profNumber == 0) %If the class hasn't been assigned yet, check to see if any professors requested the class as second preference
            for k = 1:size(professorInfo, 1) %for each professor
                if isequal(numberClassSectionsFall(i,1), professorInfo(profNumber,5)) %2nd choice
                    if (profPriority < professorInfo(profNumber,1)) %check to see if new professor has higher priority than the current professor
                        profNumber = k;
                        profPriority = professorInfo(profNumber,1);
                    end
                end
            end
        end
        
        if (profNumber == 0) %If the class hasn't been assigned yet, check to see if any professors requested the class as third preference
            for k = 1:size(professorInfo, 1) %for each professor
                if isequal(numberClassSectionsFall(i,1), professorInfo(profNumber,6)) %3rd choice
                    if (profPriority < professorInfo(profNumber,1)) %check to see if new professor has higher priority than the current professor
                        profNumber = k;
                        profPriority = professorInfo(profNumber,1);
                    end
                end
            end
        end
        
        if (profNumber == 0) %If the class hasn't been assigned yet, pick a professor with low priority who didn't mark the class as not preferred
            for k = 1:size(professorInfo, 1) %for each professor
                if ((strcmp(numberClassSectionsFall(i,1), professorInfo(profNumber,7) == 0)) && (strcmp(numberClassSectionsFall(i,1), professorInfo(profNumber,8) == 0)) && (strcmp(numberClassSectionsFall(i,1), professorInfo(profNumber,9) == 0)))
                    if ((profPriority == 0) || (profPriority < professorInfo(profNumber,1))) %check to see if new professor has lower priority than the current professor
                        profNumber = k;
                        profPriority = professorInfo(profNumber,1);
                    end
                end
            end
        end
        
        %Update teaching assignments
        teachingAssignmentsFall(i,j) = profNumber;
   end
end

%Spring Assignments
for i = 1:size(numberClassSectionsSpring, 1)  %for each class listed
   for j = 1:numberClassSectionsSpring(i,2) %for each section in each class
        profNumber = 0;
        profPriority = 0;
        %Check to see if any professors requested the class as first preference
        for k = 1:size(professorInfo, 1) %for each professor
            if isequal(numberClassSectionsSpring(i,1), professorInfo(profNumber,4)) %1st choice
                if (profPriority < professorInfo(profNumber,1)) %check to see if new professor has higher priority than the current professor
                    profNumber = k;
                    profPriority = professorInfo(profNumber,1);
                end
            end
        end
        
        if (profNumber == 0) %If the class hasn't been assigned yet, check to see if any professors requested the class as second preference
            for k = 1:size(professorInfo, 1) %for each professor
                if isequal(numberClassSectionsSpring(i,1), professorInfo(profNumber,5)) %2nd choice
                    if (profPriority < professorInfo(profNumber,1)) %check to see if new professor has higher priority than the current professor
                        profNumber = k;
                        profPriority = professorInfo(profNumber,1);
                    end
                end
            end
        end
        
        if (profNumber == 0) %If the class hasn't been assigned yet, check to see if any professors requested the class as third preference
            for k = 1:size(professorInfo, 1) %for each professor
                if isequal(numberClassSectionsSpring(i,1), professorInfo(profNumber,6)) %3rd choice
                    if (profPriority < professorInfo(profNumber,1)) %check to see if new professor has higher priority than the current professor
                        profNumber = k;
                        profPriority = professorInfo(profNumber,1);
                    end
                end
            end
        end
        
        if (profNumber == 0) %If the class hasn't been assigned yet, pick a professor with low priority who didn't mark the class as not preferred
            for k = 1:size(professorInfo, 1) %for each professor
                if ((strcmp(numberClassSectionsSpring(i,1), professorInfo(profNumber,7) == 0)) && (strcmp(numberClassSectionsSpring(i,1), professorInfo(profNumber,8) == 0)) && (strcmp(numberClassSectionsSpring(i,1), professorInfo(profNumber,9) == 0)))
                    if ((profPriority == 0) || (profPriority < professorInfo(profNumber,1))) %check to see if new professor has lower priority than the current professor
                        profNumber = k;
                        profPriority = professorInfo(profNumber,1);
                    end
                end
            end
        end
        
        %Update teaching assignments
        teachingAssignmentsSpring(i,j) = profNumber;
   end
end
end