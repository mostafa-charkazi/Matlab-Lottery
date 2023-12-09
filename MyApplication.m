classdef MyApplication < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ShahidBeheshtiUniversityUIFigure  matlab.ui.Figure
        Panel_Random                   matlab.ui.container.Panel
        NumberofpeopleLabel            matlab.ui.control.Label
        StartButton                    matlab.ui.control.Button
        Label                          matlab.ui.control.Label
        MaximumSpinner                 matlab.ui.control.Spinner
        Panel_Logo                     matlab.ui.container.Panel
        ShahidBeheshtiUniversityLabel  matlab.ui.control.Label
        Image                          matlab.ui.control.Image
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: StartButton
        function StartButtonPushed(app, event)
            for i=1:200
                random_number = randi([1 app.MaximumSpinner.Value]);
               app.Label.Text = num2str(random_number);
               pause(0.01);
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create ShahidBeheshtiUniversityUIFigure and hide until all components are created
            app.ShahidBeheshtiUniversityUIFigure = uifigure('Visible', 'off');
            app.ShahidBeheshtiUniversityUIFigure.Color = [1 1 1];
            app.ShahidBeheshtiUniversityUIFigure.Position = [100 100 754 398];
            app.ShahidBeheshtiUniversityUIFigure.Name = 'Shahid Beheshti University';
            app.ShahidBeheshtiUniversityUIFigure.Icon = fullfile(pathToMLAPP, 'logo.png');
            app.ShahidBeheshtiUniversityUIFigure.Resize = 'off';
            app.ShahidBeheshtiUniversityUIFigure.Tag = 'Shahid Beheshti University';

            % Create Panel_Logo
            app.Panel_Logo = uipanel(app.ShahidBeheshtiUniversityUIFigure);
            app.Panel_Logo.BackgroundColor = [1 1 1];
            app.Panel_Logo.Position = [15 18 308 367];

            % Create Image
            app.Image = uiimage(app.Panel_Logo);
            app.Image.Position = [18 74 262 259];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'logo.png');

            % Create ShahidBeheshtiUniversityLabel
            app.ShahidBeheshtiUniversityLabel = uilabel(app.Panel_Logo);
            app.ShahidBeheshtiUniversityLabel.HorizontalAlignment = 'center';
            app.ShahidBeheshtiUniversityLabel.FontSize = 20;
            app.ShahidBeheshtiUniversityLabel.FontWeight = 'bold';
            app.ShahidBeheshtiUniversityLabel.Position = [18 25 262 36];
            app.ShahidBeheshtiUniversityLabel.Text = 'Shahid Beheshti University';

            % Create Panel_Random
            app.Panel_Random = uipanel(app.ShahidBeheshtiUniversityUIFigure);
            app.Panel_Random.BackgroundColor = [1 1 1];
            app.Panel_Random.Position = [334 18 396 367];

            % Create MaximumSpinner
            app.MaximumSpinner = uispinner(app.Panel_Random);
            app.MaximumSpinner.Limits = [1 Inf];
            app.MaximumSpinner.HorizontalAlignment = 'center';
            app.MaximumSpinner.FontSize = 24;
            app.MaximumSpinner.FontWeight = 'bold';
            app.MaximumSpinner.Position = [38 213 324 41];
            app.MaximumSpinner.Value = 100;

            % Create Label
            app.Label = uilabel(app.Panel_Random);
            app.Label.HorizontalAlignment = 'center';
            app.Label.FontSize = 70;
            app.Label.Position = [38 27 324 91];
            app.Label.Text = '0';

            % Create StartButton
            app.StartButton = uibutton(app.Panel_Random, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @StartButtonPushed, true);
            app.StartButton.IconAlignment = 'center';
            app.StartButton.FontSize = 24;
            app.StartButton.FontWeight = 'bold';
            app.StartButton.Position = [38 142 324 47];
            app.StartButton.Text = 'Start';

            % Create NumberofpeopleLabel
            app.NumberofpeopleLabel = uilabel(app.Panel_Random);
            app.NumberofpeopleLabel.HorizontalAlignment = 'center';
            app.NumberofpeopleLabel.FontSize = 24;
            app.NumberofpeopleLabel.FontWeight = 'bold';
            app.NumberofpeopleLabel.Position = [38 268 324 43];
            app.NumberofpeopleLabel.Text = 'Number of people';

            % Show the figure after all components are created
            app.ShahidBeheshtiUniversityUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = MyApplication

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ShahidBeheshtiUniversityUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ShahidBeheshtiUniversityUIFigure)
        end
    end
end