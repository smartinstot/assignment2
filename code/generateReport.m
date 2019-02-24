function generateReport(f_p1a_numeric, f_p1b_numeric, f_p1b_analytic)
%generateReport Generates a report for the assignment
% Import report API classes (optional)
import mlreportgen.report.*
import mlreportgen.dom.* 

delete assignment2meeting.pdf
delete assignment2meeting_FO

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

add(part1,'a)');
f = Figure(f_p1a_numeric);
f.Snapshot.Height = '4in';
f.Snapshot.Width = '6in';
f.Snapshot.Caption = '2-D plot of V(x)';
add(part1,f);

add(part1,'b)');
f = Figure(f_p1b_numeric);
f.Snapshot.Height = '4in';
f.Snapshot.Width = '6in';
f.Snapshot.Caption = 'Surface Plot of V(x,y) - Numeric Solution';
add(part1,f);
f = Figure(f_p1b_analytic);
f.Snapshot.Height = '4in';
f.Snapshot.Width = '6in';
f.Snapshot.Caption = 'Surface Plot of V(x,y) - Analytic Solution';
add(part1,f);

para = Paragraph([ ... 
'When Compared, the numerical and analytical, the analytical solution is less '... 
'computationally difficult, however there is great difficulty in deciding on the '... 
'number of iterations to perform of the infinite series. This is problematic as the '... 
'series does not converge nicely. In this case, the two solutions are very different. '... 
'In addition, the analytical solution becomes impractical for complex geomoery']); 
add(part1,para);


add(rpt,part1);

% Close the report (required)
close(rpt);
% Display the report (optional)
%rptview(rpt);
end

