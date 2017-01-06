-- MASTER CODE FOR PLAYERS FOR FANTASY HOCKEY 2016-2017
-- CREATED BY ALEXANDRE BILLARD
-- All data taken from http://www.hockeyabstract.com/testimonials
-- Written with PostgreSQL

-- 2013-2014 DATA
delete from hockey.players20132014main where g = 0 OR a = 0 OR sh = 0 OR hitf = 0 OR bks = 0;

-- 2013-2014 FORWARDS
drop table hockey.ResultsForwards20132014;
Create table hockey.ResultsForwards20132014(
	Datayear varchar(10),
	firstname varchar(50),
	lastname varchar(50),
	team varchar(3),
	pos varchar(10),
	rookie varchar(1),
	gamesinjured integer,
	gamesplayed integer,
	g integer,
	a integer,
	ppp integer,
	plusminus integer,
	shots integer,
	hits integer,
	blocks integer,
	goalspergp decimal(5,4),
	goalsrank integer,
	assistpergp decimal(5,4),
	assistrank integer,
	pppPerGp decimal(5,4),
	ppprank integer,
	shotspergp decimal(5,4),
	shotsrank integer,
	hitspergp decimal(5,4),
	hitsrank integer,
	blockspergp decimal(5,4),
	blocksrank integer,
	OverallAVG decimal(10,4)
);
Insert Into hockey.ResultsForwards20132014
Select '2013-2014', m.firstname, m.lastname,
	m.endteam, m.pos, m.rk,
	m.ginj, m.gp, m.g, m.a, l.ppp, m.plusminus, m.sh, m.hitf, m.bks,
	ROUND(cast(m.g as decimal)/cast(m.gp as decimal), 4) as goalspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as RANKGOALSPERGAME,
	ROUND(cast(m.a as decimal)/cast(m.gp as decimal), 4) as applespergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as RANKAPPLESPERGAME,
	ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal), 4) as pppPerGp,
	rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as RANKPPPPERGAME,
	ROUND(cast(m.sh as decimal)/cast(m.gp as decimal), 4) as shotspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as RANKSHOTSPERGAME,
	ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal), 4) as hitspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as RANKHITSPERGAME,
	ROUND(cast(m.bks as decimal)/cast(m.gp as decimal), 4) as bkspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as RANKBLOCKSPERGAME,
	ROUND(((
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as decimal)+
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as decimal))/ 6.00000), 4) AS MAINRANK
 from hockey.players20132014main m, hockey.players20132014pp l
 where m.firstname = l.firstname AND m.lastname = l.lastname AND m.gp = l.gp AND m.POS <> 'D' AND m.GP > 20
 Order by MAINRANK ASC;

-- 2013-2014 DEFENSEMEN
drop table hockey.ResultsDefensemen20132014;
Create table hockey.ResultsDefensemen20132014(
	Datayear varchar(10),
	firstname varchar(50),
	lastname varchar(50),
	team varchar(3),
	pos varchar(10),
	rookie varchar(1),
	gamesinjured integer,
	gamesplayed integer,
	g integer,
	a integer,
	ppp integer,
	plusminus integer,
	shots integer,
	hits integer,
	blocks integer,
	goalspergp decimal(5,4),
	goalsrank integer,
	assistpergp decimal(5,4),
	assistrank integer,
	pppPerGp decimal(5,4),
	pppRank integer,
	shotspergp decimal(5,4),
	shotsrank integer,
	hitspergp decimal(5,4),
	hitsrank integer,
	blockspergp decimal(5,4),
	blocksrank integer,
	OverallAVG decimal(10,4)
);
Insert Into hockey.ResultsDefensemen20132014
Select '2013-2014', m.firstname, m.lastname,
	m.endteam, m.pos, m.rk,
	m.ginj, m.gp, m.g, m.a, l.ppp, m.plusminus, m.sh, m.hitf, m.bks,
	ROUND(cast(m.g as decimal)/cast(m.gp as decimal), 4) as goalspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as RANKGOALSPERGAME,
	ROUND(cast(m.a as decimal)/cast(m.gp as decimal), 4) as applespergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as RANKAPPLESPERGAME,
	ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal), 4) as pppPerGp,
	rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as RANKPPPPERGAME,
	ROUND(cast(m.sh as decimal)/cast(m.gp as decimal), 4) as shotspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as RANKSHOTSPERGAME,
	ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal), 4) as hitspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as RANKHITSPERGAME,
	ROUND(cast(m.bks as decimal)/cast(m.gp as decimal), 4) as bkspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as RANKBLOCKSPERGAME,
	ROUND(((
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as decimal)+
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as decimal))/ 6.00000), 4) AS MAINRANK
 from hockey.players20132014main m, hockey.players20132014pp l
 where m.firstname = l.firstname AND m.lastname = l.lastname AND m.gp = l.gp AND m.POS = 'D'  AND m.GP > 20
 Order by MAINRANK ASC;

-- 2014-2015 DATA
delete from hockey.players20142015main where g = 0 OR a = 0 OR sh = 0 OR hitf = 0 OR bks = 0;
-- 2014-2015 PLAYER DATA
drop table hockey.ResultsForwards20142015;
Create table hockey.ResultsForwards20142015(
	Datayear varchar(10),
	firstname varchar(50),
	lastname varchar(50),
	team varchar(3),
	pos varchar(10),
	rookie varchar(1),
	gamesinjured integer,
	gamesplayed integer,
	g integer,
	a integer,
	ppp integer,
	plusminus integer,
	shots integer,
	hits integer,
	blocks integer,
	goalspergp decimal(5,4),
	goalsrank integer,
	assistpergp decimal(5,4),
	assistrank integer,
	pppPerGp decimal(5,4),
	ppprank integer,
	shotspergp decimal(5,4),
	shotsrank integer,
	hitspergp decimal(5,4),
	hitsrank integer,
	blockspergp decimal(5,4),
	blocksrank integer,
	OverallAVG decimal(10,4)
);
Insert Into hockey.ResultsForwards20142015
Select '2014-2015', m.firstname, m.lastname,
	m.endteam, m.pos, m.rk,
	m.ginj, m.gp, m.g, m.a, l.ppp, m.plusminus, m.sh, m.hitf, m.bks,
	ROUND(cast(m.g as decimal)/cast(m.gp as decimal), 4) as goalspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as RANKGOALSPERGAME,
	ROUND(cast(m.a as decimal)/cast(m.gp as decimal), 4) as applespergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as RANKAPPLESPERGAME,
	ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal), 4) as pppPerGp,
	rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as RANKPPPPERGAME,
	ROUND(cast(m.sh as decimal)/cast(m.gp as decimal), 4) as shotspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as RANKSHOTSPERGAME,
	ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal), 4) as hitspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as RANKHITSPERGAME,
	ROUND(cast(m.bks as decimal)/cast(m.gp as decimal), 4) as bkspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as RANKBLOCKSPERGAME,
	ROUND(((
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as decimal)+
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as decimal))/ 6.00000), 4) AS MAINRANK
 from hockey.players20142015main m, hockey.players20142015pp l
 where m.firstname = l.firstname AND m.lastname = l.lastname AND m.gp = l.gp AND m.POS <> 'D'  AND m.GP > 20
 Order by MAINRANK ASC;

-- 2014-2015 DEFENSEMEN
drop table hockey.ResultsDefensemen20142015;
Create table hockey.ResultsDefensemen20142015(
	Datayear varchar(10),
	firstname varchar(50),
	lastname varchar(50),
	team varchar(3),
	pos varchar(10),
	rookie varchar(1),
	gamesinjured integer,
	gamesplayed integer,
	g integer,
	a integer,
	ppp integer,
	plusminus integer,
	shots integer,
	hits integer,
	blocks integer,
	goalspergp decimal(5,4),
	goalsrank integer,
	assistpergp decimal(5,4),
	assistrank integer,
	pppPerGp decimal(5,4),
	ppprank integer,
	shotspergp decimal(5,4),
	shotsrank integer,
	hitspergp decimal(5,4),
	hitsrank integer,
	blockspergp decimal(5,4),
	blocksrank integer,
	OverallAVG decimal(10,4)
);
Insert Into hockey.ResultsDefensemen20142015
Select '2014-2015', m.firstname, m.lastname,
	m.endteam, m.pos, m.rk,
	m.ginj, m.gp, m.g, m.a, l.ppp, m.plusminus, m.sh, m.hitf, m.bks,
	ROUND(cast(m.g as decimal)/cast(m.gp as decimal), 4) as goalspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as RANKGOALSPERGAME,
	ROUND(cast(m.a as decimal)/cast(m.gp as decimal), 4) as applespergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as RANKAPPLESPERGAME,
	ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal), 4) as pppPerGp,
	rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as RANKPPPPERGAME,
	ROUND(cast(m.sh as decimal)/cast(m.gp as decimal), 4) as shotspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as RANKSHOTSPERGAME,
	ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal), 4) as hitspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as RANKHITSPERGAME,
	ROUND(cast(m.bks as decimal)/cast(m.gp as decimal), 4) as bkspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as RANKBLOCKSPERGAME,
	ROUND(((
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as decimal)+
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as decimal))/ 6.00000), 4) AS MAINRANK
 from hockey.players20142015main m, hockey.players20142015pp l
 where m.firstname = l.firstname AND m.lastname = l.lastname AND m.gp = l.gp AND m.POS = 'D'  AND m.GP > 20
 Order by MAINRANK ASC;


 -- 2015-2016 DATA
delete from hockey.players20152016main where g = 0 OR a = 0 OR sh = 0 OR hitf = 0 OR bks = 0;
-- 2015-2016 Forwards DATA
drop table hockey.ResultsForwards20152016;
Create table hockey.ResultsForwards20152016(
	Datayear varchar(10),
	firstname varchar(50),
	lastname varchar(50),
	age integer,
	team varchar(3),
	pos varchar(10),
	rookie varchar(1),
	gamesinjured integer,
	gamesplayed integer,
	g integer,
	a integer,
	ppp integer,
	plusminus integer,
	shots integer,
	hits integer,
	blocks integer,
	goalspergp decimal(5,4),
	goalsrank integer,
	assistpergp decimal(5,4),
	assistrank integer,
	pppPerGp decimal(5,4),
	ppprank integer,
	shotspergp decimal(5,4),
	shotsrank integer,
	hitspergp decimal(5,4),
	hitsrank integer,
	blockspergp decimal(5,4),
	blocksrank integer,
	OverallAVG decimal(10,4)
);
Insert Into hockey.ResultsForwards20152016
Select '2015-2016', m.firstname, m.lastname,  m.age,
	m.endteam, m.pos, m.rk,
	m.ginj, m.gp, m.g, m.a, l.ppp, m.plusminus, m.sh, m.hitf, m.bks,
	ROUND(cast(m.g as decimal)/cast(m.gp as decimal), 4) as goalspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as RANKGOALSPERGAME,
	ROUND(cast(m.a as decimal)/cast(m.gp as decimal), 4) as applespergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as RANKAPPLESPERGAME,
	ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal), 4) as pppPerGp,
	rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as RANKPPPPERGAME,
	ROUND(cast(m.sh as decimal)/cast(m.gp as decimal), 4) as shotspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as RANKSHOTSPERGAME,
	ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal), 4) as hitspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as RANKHITSPERGAME,
	ROUND(cast(m.bks as decimal)/cast(m.gp as decimal), 4) as bkspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as RANKBLOCKSPERGAME,
	ROUND(((
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as decimal)+
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as decimal))/ 6.00000), 4) AS MAINRANK
 from hockey.players20152016main m, hockey.players20152016pp l
 where m.firstname = l.firstname AND m.lastname = l.lastname AND m.gp = l.gp AND m.POS <> 'D'  AND m.GP > 20
 Order by MAINRANK ASC;


-- 2015-2016 Defensemen DATA
drop table hockey.ResultsDefensemen20152016;
Create table hockey.ResultsDefensemen20152016(
	Datayear varchar(10),
	firstname varchar(50),
	lastname varchar(50),
	age integer,
	team varchar(3),
	pos varchar(10),
	rookie varchar(1),
	gamesinjured integer,
	gamesplayed integer,
	g integer,
	a integer,
	ppp integer,
	plusminus integer,
	shots integer,
	hits integer,
	blocks integer,
	goalspergp decimal(5,4),
	goalsrank integer,
	assistpergp decimal(5,4),
	assistrank integer,
	pppPerGp decimal(5,4),
	ppprank integer,
	shotspergp decimal(5,4),
	shotsrank integer,
	hitspergp decimal(5,4),
	hitsrank integer,
	blockspergp decimal(5,4),
	blocksrank integer,
	OverallAVG decimal(10,4)
);
Insert Into hockey.ResultsDefensemen20152016
Select '2015-2016', m.firstname, m.lastname,  m.age,
	m.endteam, m.pos, m.rk,
	m.ginj, m.gp, m.g, m.a, l.ppp, m.plusminus, m.sh, m.hitf, m.bks,
	ROUND(cast(m.g as decimal)/cast(m.gp as decimal), 4) as goalspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as RANKGOALSPERGAME,
	ROUND(cast(m.a as decimal)/cast(m.gp as decimal), 4) as applespergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as RANKAPPLESPERGAME,
	ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal), 4) as pppPerGp,
	rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as RANKPPPPERGAME,
	ROUND(cast(m.sh as decimal)/cast(m.gp as decimal), 4) as shotspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as RANKSHOTSPERGAME,
	ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal), 4) as hitspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as RANKHITSPERGAME,
	ROUND(cast(m.bks as decimal)/cast(m.gp as decimal), 4) as bkspergp,
	rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as RANKBLOCKSPERGAME,
	ROUND(((
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.g as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.a as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(l.ppp as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.sh as decimal)/cast(m.gp as decimal),4) DESC) as decimal)+
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.hitf as decimal)/cast(m.gp as decimal),4) DESC) as decimal) +
	cast(rownumber() OVER (ORDER BY ROUND(cast(m.bks as decimal)/cast(m.gp as decimal),4) DESC) as decimal))/ 6.00000), 4) AS MAINRANK
 from hockey.players20152016main m, hockey.players20152016pp l
 where m.firstname = l.firstname AND m.lastname = l.lastname AND m.gp = l.gp AND m.POS = 'D'  AND m.GP > 20
 Order by MAINRANK ASC;
--Select * from players20152016main;

-- FinalCalculations
-- Forwards
drop table hockey.FinalCalculationsForwards;
Create table hockey.FinalCalculationsForwards(
	firstname varchar(50), lastname varchar(50), age20152016 integer,
	team20152016 varchar(3), team20142015 varchar(3), team20132014 varchar(3),
	pos20152016 varchar(10), pos20142015 varchar(10), pos20132014 varchar(10),
	rookie20152016 varchar(1),
	gamesinjured20152016 integer, gamesinjured20142015 integer, gamesinjured20132014 integer,
	gamesplayed20152016 integer, gamesplayed20142015 integer, gamesplayed20132014 integer,
	goalsrank20152016 integer, goalsrank20142015 integer, goalsrank20132014 integer,
	assistrank20152016 integer, assistrank20142015 integer, assistrank20132014 integer,
	ppprank20152016 integer, ppprank20142015 integer, ppprank20132014 integer,
	shotsrank20152016 integer, shotsrank20142015 integer, shotsrank20132014 integer,
	hitsrank20152016 integer, hitsrank20142015 integer, hitsrank20132014 integer,
	blocksrank20152016 integer, blocksrank20142015 integer, blocksrank20132014 integer,
	OverallAVG20152016 decimal(10,4), OverallAVG20142015 decimal(10,4), OverallAVG20132014 decimal(10,4),
	OverallRANK20152016 integer, OverallSNIPERRANK20152016 integer
);
Insert Into hockey.FinalCalculationsForwards
Select t15.firstname, t15.lastname,  t15.age,
	t15.team, 'N/A', 'N/A', --t14.team, t13.team,
	t15.pos, 'N/A', 'N/A', --t14.pos, t13.pos,
	t15.rookie,
	t15.gamesinjured, 0, 0, --t14.gamesinjured, t13.gamesinjured,
	t15.gamesplayed, 0, 0, --t14.gamesplayed, t13.gamesplayed,
	t15.goalsrank, 0, 0, --t14.goalsrank, t13.goalsrank,
	t15.assistrank, 0, 0, --t14.assistrank,  t13.assistrank,
	t15.ppprank, 0, 0, --t14.ppprank, t13.ppprank,
	t15.shotsrank,  0, 0, --t14.shotsrank, t13.shotsrank,
	t15.hitsrank,  0, 0, --t14.hitsrank, t13.hitsrank,
	t15.blocksrank,  0, 0, --t14.blocksrank,  t13.blocksrank,
	t15.OverallAVG,
	0000.00000, --t14.OverallAVG,
	0000.00000, --t13.OverallAVG,
	rownumber() OVER (ORDER BY t15.OverallAVG ASC) as Overall2015,
	((t15.goalsrank+t15.assistrank+t15.ppprank+t15.shotsrank)/4) as Snipe2015--rownumber() OVER (ORDER BY t14.OverallAVG ASC) as Overall2014,
 from hockey.ResultsForwards20152016 t15
 Order by Overall2015;

 Update hockey.FinalCalculationsForwards f SET team20142015 = (Select t.team from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET team20132014 = (Select t.team from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET pos20142015 = (Select t.pos from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET pos20132014 = (Select t.pos from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET gamesinjured20142015 = (Select t.gamesinjured from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET gamesinjured20132014 = (Select t.gamesinjured from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET gamesplayed20142015 = (Select t.gamesplayed from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET gamesplayed20132014 = (Select t.gamesplayed from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET goalsrank20142015 = (Select t.goalsrank from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET goalsrank20132014 = (Select t.goalsrank from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET assistrank20142015 = (Select t.assistrank from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET assistrank20132014 = (Select t.assistrank from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET ppprank20142015 = (Select t.ppprank from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET ppprank20132014 = (Select t.ppprank from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET shotsrank20142015 = (Select t.shotsrank from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET shotsrank20132014 = (Select t.shotsrank from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET hitsrank20142015 = (Select t.hitsrank from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET hitsrank20132014 = (Select t.hitsrank from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET blocksrank20142015 = (Select t.blocksrank from hockey.ResultsForwards20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsForwards f SET blocksrank20132014 = (Select t.blocksrank from hockey.ResultsForwards20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsForwards f SET OverallAVG20142015 = (Select t.OverallAVG from hockey.ResultsForwards20142015 t where t.firstname = f.firstname AND t.lastname = f.lastname);
 Update hockey.FinalCalculationsForwards f SET OverallAVG20132014 = (Select t.OverallAVG from hockey.ResultsForwards20132014 t where t.firstname = f.firstname AND t.lastname = f.lastname);

-- FinalCalculations
-- Defensemen
drop table hockey.FinalCalculationsDefensemen;
Create table hockey.FinalCalculationsDefensemen(
	firstname varchar(50), lastname varchar(50), age20152016 integer,
	team20152016 varchar(3), team20142015 varchar(3), team20132014 varchar(3),
	pos20152016 varchar(10), pos20142015 varchar(10), pos20132014 varchar(10),
	rookie20152016 varchar(1),
	gamesinjured20152016 integer, gamesinjured20142015 integer, gamesinjured20132014 integer,
	gamesplayed20152016 integer, gamesplayed20142015 integer, gamesplayed20132014 integer,
	goalsrank20152016 integer, goalsrank20142015 integer, goalsrank20132014 integer,
	assistrank20152016 integer, assistrank20142015 integer, assistrank20132014 integer,
	ppprank20152016 integer, ppprank20142015 integer, ppprank20132014 integer,
	shotsrank20152016 integer, shotsrank20142015 integer, shotsrank20132014 integer,
	hitsrank20152016 integer, hitsrank20142015 integer, hitsrank20132014 integer,
	blocksrank20152016 integer, blocksrank20142015 integer, blocksrank20132014 integer,
	OverallAVG20152016 decimal(10,4), OverallAVG20142015 decimal(10,4), OverallAVG20132014 decimal(10,4),
	OverallRANK20152016 integer
);
Insert Into hockey.FinalCalculationsDefensemen
Select t15.firstname, t15.lastname,  t15.age,
	t15.team, 'N/A', 'N/A', --t14.team, t13.team,
	t15.pos, 'N/A', 'N/A', --t14.pos, t13.pos,
	t15.rookie,
	t15.gamesinjured, 0, 0, --t14.gamesinjured, t13.gamesinjured,
	t15.gamesplayed, 0, 0, --t14.gamesplayed, t13.gamesplayed,
	t15.goalsrank, 0, 0, --t14.goalsrank, t13.goalsrank,
	t15.assistrank, 0, 0, --t14.assistrank,  t13.assistrank,
	t15.ppprank, 0, 0, --t14.ppprank, t13.ppprank,
	t15.shotsrank,  0, 0, --t14.shotsrank, t13.shotsrank,
	t15.hitsrank,  0, 0, --t14.hitsrank, t13.hitsrank,
	t15.blocksrank,  0, 0, --t14.blocksrank,  t13.blocksrank,
	t15.OverallAVG,
	0000.00000, --t14.OverallAVG,
	0000.00000, --t13.OverallAVG,
	rownumber() OVER (ORDER BY t15.OverallAVG ASC) as Overall2015
 from hockey.ResultsDefensemen20152016 t15
 Order by Overall2015;

 Update hockey.FinalCalculationsDefensemen f SET team20142015 = (Select t.team from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET team20132014 = (Select t.team from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET pos20142015 = (Select t.pos from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET pos20132014 = (Select t.pos from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET gamesinjured20142015 = (Select t.gamesinjured from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET gamesinjured20132014 = (Select t.gamesinjured from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET gamesplayed20142015 = (Select t.gamesplayed from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET gamesplayed20132014 = (Select t.gamesplayed from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET goalsrank20142015 = (Select t.goalsrank from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET goalsrank20132014 = (Select t.goalsrank from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET assistrank20142015 = (Select t.assistrank from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET assistrank20132014 = (Select t.assistrank from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET ppprank20142015 = (Select t.ppprank from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET ppprank20132014 = (Select t.ppprank from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET shotsrank20142015 = (Select t.shotsrank from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET shotsrank20132014 = (Select t.shotsrank from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET hitsrank20142015 = (Select t.hitsrank from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET hitsrank20132014 = (Select t.hitsrank from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET blocksrank20142015 = (Select t.blocksrank from hockey.ResultsDefensemen20142015 t where f.firstname = t.firstname AND f.lastname = t.lastname);
 Update hockey.FinalCalculationsDefensemen f SET blocksrank20132014 = (Select t.blocksrank from hockey.ResultsDefensemen20132014 t where f.firstname = t.firstname AND f.lastname = t.lastname);

 Update hockey.FinalCalculationsDefensemen f SET OverallAVG20142015 = (Select t.OverallAVG from hockey.ResultsDefensemen20142015 t where t.firstname = f.firstname AND t.lastname = f.lastname);
 Update hockey.FinalCalculationsDefensemen f SET OverallAVG20132014 = (Select t.OverallAVG from hockey.ResultsDefensemen20132014 t where t.firstname = f.firstname AND t.lastname = f.lastname);
