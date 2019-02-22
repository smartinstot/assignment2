function generateReport(f)
%generateReport Generates a report for the assignment
% Import report API classes (optional)
import mlreportgen.report.*
import mlreportgen.dom.* 

delete assignment2meeting.pdf

% Add report container (required)
rpt = Report('assignment2meeting','pdf');

% Add content to container (required)
% Types of content added here: title 
% page and table of contents reporters
titlepg = TitlePage;
titlepg.Title = 'ELEC 4700 Assignment 2';
titlepg.Subtitle = 'Finite Difference Method';
titlepg.Author = 'David Bascelli';
add(rpt,titlepg);
add(rpt,TableOfContents);

% Part 1
part1 = Chapter('Analytical versus Numerical Solutions');
add(part1,'Here is the plane:');
f = Figure(f);
f.Snapshot.Height = '4in';
f.Snapshot.Width = '6in';
f.Snapshot.Caption = 'Solution';

para = Paragraph([ ... 
'When Compared, the numerical and analytical '... 
'However, the analytical solution becomes impractical for complex geomoery']); 
add(part1,para);
add(part1,f);
add(rpt,part1);

% Close the report (required)
close(rpt);
% Display the report (optional)
%rptview(rpt);
end

