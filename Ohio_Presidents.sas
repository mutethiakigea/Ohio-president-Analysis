proc import datafile='/home/u63491719/USPresidents.csv'
dbms=csv
out=uspresidents
replace;
getnames=yes;
run;

data past_presidents;
set presidents;
where HomeState='Ohio';
run;

proc print data=work.past_presidents;
run;

data past_presidents;
set presidents;
where HomeState='Ohio';
DaysInOffice = Leftoffice - Tookoffice;
format DaysInOffice 6.;
run;

proc print data=work.past_presidents;
   var Presidency President Tookoffice Leftoffice DaysInOffice;
run;
