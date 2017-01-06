--- MASTERCODE FOR GOALIES FOR FANTASY HOCKEY 2016-2017
-- CREATED BY ALEXANDRE BILLARD
-- All data taken from http://www.hockeyabstract.com/testimonials
-- Written with PostgreSQL

-- 2013-2014 DATA
drop table hockey.ResultsGoalies20132014;
Create table hockey.ResultsGoalies20132014(
  FirstName varchar(50),
  LastName varchar(50),
  Team varchar(10),
  GP integer,
  gInjured integer,
  gStarted integer,
  W integer,
  GAA decimal(5,3),
  SVPCT decimal(5,3),
  SO integer,
  PULL integer
);

Insert Into hockey.ResultsGoalies20132014
  Select firstname, lastname, alltm, gp, ginj, gs, w, gaa, svpct, so, PULL
  from hockey.goalies20132014;


-- 2014-2015 DATA
drop table hockey.ResultsGoalies20142015;
Create table hockey.ResultsGoalies20142015(
  FirstName varchar(50),
  LastName varchar(50),
  Team varchar(10),
  GP integer,
  gInjured integer,
  gStarted integer,
  W integer,
  GAA decimal(5,3),
  SVPCT decimal(5,3),
  SO integer,
  PULL integer
);

Insert Into hockey.ResultsGoalies20142015
  Select firstname, lastname, alltm, gp, ginj, gs, w, gaa, svpct, so, PULL
  from hockey.goalies20142015;

-- 2015-2016 DATA
drop table hockey.ResultsGoalies20152016;
Create table hockey.ResultsGoalies20152016(
  FirstName varchar(50),
  LastName varchar(50),
  Team varchar(10),
  GP integer,
  gInjured integer,
  gStarted integer,
  W integer,
  GAA decimal(5,3),
  SVPCT decimal(5,3),
  SO integer,
  PULL integer
);

Insert Into hockey.ResultsGoalies20152016
    Select firstname, lastname, alltm, gp, ginj, gs, w, gaa, svpct, so, PULL
    from hockey.goalies20152016;

-- FinalCalculations
-- Goalies
drop table hockey.FinalCalculationsGoalies;
Create table hockey.FinalCalculationsGoalies(
  firstname varchar(50), lastname varchar(50),
  team20152016 varchar(10), team20142015 varchar(10), team20132014 varchar(10),
  gp20152016 integer, gp20142015 integer, gp20132014 integer,
  gInjured20152016 integer, gInjured20142015 integer, gInjured20132014 integer,
  gstarted20152016 integer, gstarted20142015 integer, gstarted20132014 integer,
  W20152016 integer, W20142015 integer, W20132014 integer,
  GAA20152016 decimal(5,3), GAA20142015 decimal(5,3), GAA20132014 decimal(5,3),
  SVPCT20152016 decimal(5,3), SVPCT20142015 decimal(5,3), SVPCT20132014 decimal(5,3),
  SO20152016 integer, SO20142015 integer, SO20132014 integer,
  PULL20152016 integer, PULL20142015 integer, PULL20132014 integer
);
  Insert Into hockey.FinalCalculationsGoalies
      Select t15.firstname, t15.lastname,
       t15.team, 'N/A', 'N/A', -- t14.team, t13.team,
       t15.gp, 0, 0, -- t14.gp, t13.gp,
       t15.gInjured, 0, 0, -- t14.gInjured, t13.gInjured,
       t15.gstarted, 0, 0, -- t14.gstarted, t13.gstarted,
       t15.w, 0, 0, -- t14.w, t13.w,
       t15.gaa, 0, 0, -- t14.gaa,  t13.gaa,
       t15.SVPCT, 0, 0, -- t14.SVPCT , t13.SVPCT,
       t15.so, 0, 0, -- t14.so, t13.so,
       t15.pull, 0, 0 -- t14.pull, t13.pull
       from hockey.ResultsGoalies20152016 t15;

 Update hockey.FinalCalculationsGoalies f SET team20142015 = (Select t.team from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET team20132014 = (Select t.team from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsGoalies f SET gp20142015 = (Select t.gp from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET gp20132014 = (Select t.gp from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsGoalies f SET gInjured20142015 = (Select t.gInjured from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET gInjured20132014 = (Select t.gInjured from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsGoalies f SET gstarted20142015 = (Select t.gStarted from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET gstarted20132014 = (Select t.gStarted from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsGoalies f SET w20142015 = (Select t.w from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET w20132014 = (Select t.w from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsGoalies f SET gaa20142015 = (Select t.gaa from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET gaa20132014 = (Select t.gaa from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsGoalies f SET SVPCT20142015 = (Select t.SVPCT from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET SVPCT20132014 = (Select t.SVPCT from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsGoalies f SET SO20142015 = (Select t.SO from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET SO20132014 = (Select t.SO from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsGoalies f SET pull20142015 = (Select t.pull from hockey.ResultsGoalies20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsGoalies f SET pull20132014 = (Select t.pull from hockey.ResultsGoalies20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);
