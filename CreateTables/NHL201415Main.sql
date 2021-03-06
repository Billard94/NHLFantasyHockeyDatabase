-- DROP TABLE Players20142015MAIN;

Create table hockey.Players20142015MAIN (
	HockeyNumber char(2),
	Ctry char(3),
	Nat char(3),
	HT	integer,
	Wt	integer,
	S	char(1),
	Draft	integer,
	Round	integer,
	Overall	integer,
	Rk	char(3),
	Age	integer,
	FirstName	char(50),
	LastName	char(50),
	EndTeam	char(3),
	Teams	char(30),
	Pos	char(10),
	GP	integer,
	G	integer,
	A	integer,
	A1	integer,
	PTS	integer,
	PlusMinus integer,
	Sh	integer,
	Misses	integer,
	Blocked	integer,
	ShPCT char(10),
	CoSHPC	Decimal(5,3),
	TOI	Decimal(7,3),
	TOIG	Decimal(5,3),
	Shifts	integer,
	ShG	Decimal(5,3),
	TOISh	Decimal(5,3),
	Passes	integer,
	PaSixty Decimal(5,3),
	IGP	Decimal(5,3),
	IAP	Decimal(5,3),
	IPP	Decimal(5,3),
	FOW	integer,
	FOL	integer,
	FOPCT	Decimal(5,3),
	OpenFOT	integer,
	OpenFOW	integer,
	HitA	integer,
	HitF	integer,
	BkS	integer,
	MsS	integer,
	GvA	integer,
	TkA	integer,
	HASixty	Decimal(5,3),
	HFSixty Decimal(5,3),
	BSixty Decimal(5,3),
	MSixty Decimal(5,3),
	GSixty Decimal(5,3),
	TSixty Decimal(5,3),
	PIM integer,
	Minor	integer,
	Major	integer,
	Misc	integer,
	GMisc	integer,
	Match	integer,
	Grit	integer,
	NetPen	Decimal(5,3),
	SOS	integer,
	SOG	integer,
	SOPCT Decimal(5,3),
	SOGDG	integer,
	ONEG	integer,
	OTG	integer,
	GWG	integer,
	ENG	integer,
	PSG	integer,
	PST	integer,
	PSPCT	Decimal(5,3),
	OPs	Decimal(5,3),
	DPS	Decimal(5,3),
	PS	Decimal(5,3),
	PSG	Decimal(5,3),
	PSSixty Decimal(5,3),
	DIA	integer,
	OGIT	Decimal(5,3),
	DIT	Decimal(5,3),
	RPM	Decimal(5,3),
	OGVT	Decimal(5,3),
	DGVT	Decimal(5,3),
	SGVT	Decimal(5,3),
	GVT	Decimal(5,3),
	GVTG	Decimal(5,3),
	GVTSixty	Decimal(5,3),
	FirstStar	integer,
	SecondStar	integer,
	ThirdStar	integer,
	Days	integer,
	Ginj	integer,
	Injury	char(50),
	CapCost	Decimal(5,3),
	CHIP	Decimal(5,4),
	Bonuses	Decimal(5,3),
	GVS DECIMAL(5,3)
);
