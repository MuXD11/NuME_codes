% Define the file name
file_name = 'thermo.log';

% Check if the file exists in the current directory
if ~isfile(file_name)
    fprintf('File not found: %s\n', file_name);
    return;
end

% Open the file for reading
fid = fopen(file_name, 'r');

% Read the first line to skip the header
header = fgetl(fid);

% Read the rest of the data
data = textscan(fid, '%f %f %f %f %f %f', 'Delimiter', ' ', 'MultipleDelimsAsOne', true);

% Close the file
fclose(fid);

% Convert cell array to table
data = table(data{1}, data{2}, data{3}, data{4}, data{5}, data{6}, ...
    'VariableNames', {'Step', 'Time', 'Temperature', 'E_kin', 'E_pot', 'Pressure'});

% Plot Temperature vs. Time
figure;
plot(data.Time, data.Temperature, 'DisplayName', 'Temperature');
xlabel('Time');
ylabel('Temperature');
title('Temperature vs. Time');
legend;
grid on;
