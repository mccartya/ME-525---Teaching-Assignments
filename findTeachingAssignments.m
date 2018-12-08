function [bestTeachingAssignments, minObjectiveFunction] = findTeachingAssignments(numberClassSections, professorInfo)   
% This function (along with the helper functions objectiveFunctionEntries
% and assigningProfessorsToSections) assign professors to teach class
% openings for a given semester while prioritizing department designated professor priority,
% professor preferences, and whether the professor has previously taught the class

% Description of Inputs:

% numberClassSections - a two column matrix where the first matrix
% lists each course code and adjoining cell in the second column is the
% number of sections of the class

% professorInfo - a 17 column matrix where: column 1 - professor code,
% column 2 - department priority, column 3 - number of classes to teach that 
% semester, column 4 - 1st preference, column 5 - 2nd preference,  column 6 - 
% 3rd preference, columns 7 through 9 - not prefered classes, columns 10 through 17 -
% previously taught classes (if less, list zeros)

    currentBestTeachingAssignments = [];
    currentBestObjectiveFunctionValue = 0;
    
    %make avaliableTeachers matrix where the first column is their professor number 
    %and the second column is the number of classes they will teach that semester
    avaliableTeachers = zeros(size(professorInfo, 1), 2);
    for i = 1:size(professorInfo, 1)
        avaliableTeachers(i, 1) = professorInfo(i, 1);
        avaliableTeachers(i, 2) = professorInfo(i, 3);
    end
    
    for i = 1:size(professorInfo,1) %for each different starting professor
        for j = 1:size(numberClassSections,1)
            pointMatrix = objectiveFunctionEntries(numberClassSections, professorInfo);
            [tempTeachingAssignments, tempObjectiveFunctionValue] = assigningProfessorsToSections(numberClassSections, pointMatrix, i, j, avaliableTeachers);
            if(tempObjectiveFunctionValue < currentBestObjectiveFunctionValue)
                currentBestObjectiveFunctionValue = tempObjectiveFunctionValue;
                currentBestTeachingAssignments = tempTeachingAssignments;
            end
        end
    end
    
    %save the best teaching assignments with the minimum value
    bestTeachingAssignments = currentBestTeachingAssignments;
    minObjectiveFunction = currentBestObjectiveFunctionValue;
end
