{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 11,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ -2526.0, -181.0, 2492.0, 1319.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-65",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1569.400008500000013, 1190.548095999999987, 295.0, 22.0 ],
					"text" : "Recording unit from class demo"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1529.400008499999785, 1276.881348000000116, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1513.650008499999785, 1228.666625999999951, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1494.650008499999785, 1160.714721999999938, 35.0, 22.0 ],
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1494.650008499999785, 1312.048095999999987, 59.0, 22.0 ],
					"text" : "sfrecord~"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-59",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1002.80003250000027, 1283.666747999999643, 295.0, 22.0 ],
					"text" : "Final output"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-58",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 815.166687000000024, 343.0, 441.0, 53.0 ],
					"text" : "The +~ object here is to mitigate the case when random frequency is too low, which I think is a problem since the resulting sound would be too plain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 767.0, 343.0, 39.0, 22.0 ],
					"text" : "+~ 10"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-49",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 889.0, 290.0, 441.0, 38.0 ],
					"text" : "The input to the phasor (frequency) is randomly generated, with tunable random frequency and amplitude"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-47",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 802.5, 1014.666747999999643, 295.0, 53.0 ],
					"text" : "Select between two output modes, one with biquad~ filter applied last and the other with reson filter"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-44",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.400008500000013, 1134.048095999999987, 351.0, 100.0 ],
					"text" : "object 5: reson~\nI experimented with several filters and chose the resonant bandpass filter simply because it sounds interesting to me. \nA line~ function is applied to the central frequency of the filter to tunable effects"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-38",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 51.833312999999976, 728.666626000000065, 277.0, 69.0 ],
					"text" : "7 available presets.\nThey play with phasor frequencies of different random settings, as well as the two output modes"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-34",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1095.05003250000027, 795.0, 337.0, 53.0 ],
					"text" : "The delayed signals are scaled differently, applied to different filters, and finally added up together to enrich the sound"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-30",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1561.400008500000013, 371.0, 295.0, 53.0 ],
					"text" : "object 4: delay~\nI connect multiple delayed sawtooth signal to create a denser sequence of sound"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-28",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 605.0, 116.0, 299.0, 53.0 ],
					"text" : "object 1: incdec\nI use incdec to have more precise control over several parameters than sliders"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-27",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 354.25, 423.666626000000065, 263.0, 53.0 ],
					"text" : "object 3: kink~\nThis object is connected to phasor~ to smoothen its timber"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.776470588235294, 0.164705882352941, 0.164705882352941, 0.0 ],
					"fontsize" : 14.0,
					"id" : "obj-23",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 763.5, 405.666626000000065, 351.0, 38.0 ],
					"text" : "object 2: phasor~\nI use this as the source signal to have a \"clicky\" sound"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"knobcolor" : [ 0.368627450980392, 1.0, 0.831372549019608, 1.0 ],
					"maxclass" : "slider",
					"min" : 100.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 596.583333333333258, 722.833373999999935, 20.0, 140.0 ],
					"size" : 901.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 594.0, 892.333373999999822, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 856.10834183333327, 1111.548095999999987, 65.583333333333258, 20.0 ],
					"text" : "biquad",
					"textcolor" : [ 0.129411764705882, 0.129411764705882, 0.129411764705882, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 856.10834183333327, 1096.548095999999987, 65.583333333333258, 20.0 ],
					"text" : "reson",
					"textcolor" : [ 0.129411764705882, 0.129411764705882, 0.129411764705882, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 856.10834183333327, 1081.548095999999987, 30.583333333333258, 20.0 ],
					"text" : "off",
					"textcolor" : [ 0.129411764705882, 0.129411764705882, 0.129411764705882, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.007843137254902, 0.015686274509804, 0.019607843137255, 1.0 ],
					"bgcolor" : [ 0.607843137254902, 0.72156862745098, 0.815686274509804, 1.0 ],
					"disabled" : [ 0, 0, 0 ],
					"id" : "obj-130",
					"itemtype" : 0,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 837.400008500000013, 1081.548095999999987, 77.0, 50.0 ],
					"size" : 3,
					"value" : 2
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 837.400008500000013, 1159.714722000000165, 68.0, 22.0 ],
					"text" : "selector~ 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 48.0, 559.686194499999715, 47.0, 22.0 ],
					"text" : "clearall"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.666707333333534, 986.333373999999822, 77.0, 22.0 ],
					"text" : "loadmess 15"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 645.666707333333534, 1025.333373999999822, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 418.666707333333534, 1014.666747999999643, 73.0, 22.0 ],
					"text" : "loadmess 4."
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.886274509803922, 1.0, 1.0 ],
					"id" : "obj-112",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 532.583333333333258, 892.333373999999822, 41.0, 41.0 ],
					"uncheckedcolor" : [ 0.980392156862745, 0.043137254901961, 0.043137254901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 532.583333333333258, 951.333373999999822, 69.0, 22.0 ],
					"text" : "metro 1000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-102",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 532.583333333333258, 986.333373999999822, 99.0, 23.0 ],
					"text" : "200, 8000 2000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 532.583333333333258, 1025.333373999999822, 36.0, 23.0 ],
					"text" : "line~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"format" : 6,
					"id" : "obj-18",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 419.916666666666629, 1038.666747999999643, 52.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 307.25, 1065.333373999999822, 357.0, 23.0 ],
					"text" : "reson~ 1. 200 23"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"maxclass" : "incdec",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 604.0, 176.0, 20.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-96",
					"maxclass" : "incdec",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1103.0, 190.287949000000026, 20.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "incdec",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 493.583333333333258, 308.0, 20.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 541.583333333333258, 314.0, 73.0, 22.0 ],
					"text" : "loadmess 1."
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-92",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 557.583333333333258, 371.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"knobcolor" : [ 0.431372549019608, 0.776470588235294, 0.52156862745098, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 414.0, 176.0, 163.0, 23.0 ],
					"size" : 100.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"knobcolor" : [ 0.964705882352941, 0.317647058823529, 0.317647058823529, 1.0 ],
					"maxclass" : "slider",
					"min" : 1.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1055.0, 41.287948999999998, 20.0, 140.0 ],
					"size" : 2000.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 648.0, 176.0, 73.0, 22.0 ],
					"text" : "loadmess 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 899.0, 180.0, 73.0, 22.0 ],
					"text" : "loadmess 3."
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-76",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 855.400008500000013, 254.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 828.166687000000024, 311.0, 37.0, 22.0 ],
					"text" : "*~ 10"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-50",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 728.5, 236.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 728.5, 277.0, 40.0, 22.0 ],
					"text" : "rand~"
				}

			}
, 			{
				"box" : 				{
					"attr" : "edit_mode",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-42",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1436.800017000000025, 909.333373999999822, 207.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1231.300032500000043, 1066.000121999999465, 71.5, 22.0 ],
					"text" : "biquad~"
				}

			}
, 			{
				"box" : 				{
					"domain" : [ 20.0, 16000.0 ],
					"fontface" : 0,
					"id" : "obj-46",
					"linmarkers" : [ 0.0, 11025.0, 16537.5 ],
					"logmarkers" : [ 0.0, 100.0, 1000.0, 10000.0 ],
					"maxclass" : "filtergraph~",
					"nfilters" : 1,
					"numinlets" : 8,
					"numoutlets" : 7,
					"outlettype" : [ "list", "float", "float", "float", "float", "list", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1410.400008500000013, 965.666747999999643, 202.0, 96.0 ],
					"setfilter" : [ 0, 4, 1, 0, 0, 8000.0, 1.198318243026733, 0.946666419506073, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "edit_mode",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-37",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1113.383309666666491, 523.666626000000065, 207.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1051.383325166666509, 694.333373999999935, 71.5, 22.0 ],
					"text" : "biquad~"
				}

			}
, 			{
				"box" : 				{
					"domain" : [ 20.0, 16000.0 ],
					"fontface" : 0,
					"id" : "obj-41",
					"linmarkers" : [ 0.0, 11025.0, 16537.5 ],
					"logmarkers" : [ 0.0, 100.0, 1000.0, 10000.0 ],
					"maxclass" : "filtergraph~",
					"nfilters" : 1,
					"numinlets" : 8,
					"numoutlets" : 7,
					"outlettype" : [ "list", "float", "float", "float", "float", "list", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1087.983301166666479, 562.999999999999886, 202.0, 96.0 ],
					"setfilter" : [ 0, 2, 1, 0, 0, 971.8316650390625, 1.598521709442139, 0.177161529660225, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "edit_mode",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-33",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 797.900038500000164, 528.666626000000065, 207.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 729.40002400000003, 677.333373999999935, 71.5, 22.0 ],
					"text" : "biquad~"
				}

			}
, 			{
				"box" : 				{
					"domain" : [ 20.0, 16000.0 ],
					"fontface" : 0,
					"id" : "obj-36",
					"linmarkers" : [ 0.0, 11025.0, 16537.5 ],
					"logmarkers" : [ 0.0, 100.0, 1000.0, 10000.0 ],
					"maxclass" : "filtergraph~",
					"nfilters" : 1,
					"numinlets" : 8,
					"numoutlets" : 7,
					"outlettype" : [ "list", "float", "float", "float", "float", "list", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 767.0, 562.999999999999886, 202.0, 96.0 ],
					"setfilter" : [ 0, 1, 1, 0, 0, 584.75469970703125, 1.793768405914307, 0.177161529660225, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1437.400008500000013, 685.666626000000065, 40.0, 22.0 ],
					"text" : "*~ 0.7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1410.400008500000013, 635.666626000000065, 40.0, 22.0 ],
					"text" : "*~ 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1373.400008500000013, 559.686194499999715, 40.0, 22.0 ],
					"text" : "*~ 0.3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 624.5, 427.666626000000065, 47.0, 22.0 ],
					"text" : "kink~ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1578.400008500000013, 728.666626000000065, 125.0, 23.0 ],
					"text" : "delay~ 44100 4410"
				}

			}
, 			{
				"box" : 				{
					"attr" : "delay",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-4",
					"lock" : 1,
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1684.40000850000024, 685.666626000000065, 180.0, 23.0 ],
					"text_width" : 56.0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1578.400008500000013, 629.666626000000065, 125.0, 23.0 ],
					"text" : "delay~ 44100 4410"
				}

			}
, 			{
				"box" : 				{
					"attr" : "delay",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-85",
					"lock" : 1,
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1684.40000850000024, 586.666626000000065, 180.0, 23.0 ],
					"text_width" : 56.0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1578.400008500000013, 544.666626000000065, 125.0, 23.0 ],
					"text" : "delay~ 44100 4410"
				}

			}
, 			{
				"box" : 				{
					"attr" : "delay",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-83",
					"lock" : 1,
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1684.40000850000024, 500.666626000000065, 180.0, 23.0 ],
					"text_width" : 56.0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1547.483301166666479, 468.666626000000065, 125.0, 23.0 ],
					"text" : "delay~ 44100 4410"
				}

			}
, 			{
				"box" : 				{
					"attr" : "delay",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-79",
					"lock" : 1,
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1561.400008500000013, 430.666626000000065, 180.0, 23.0 ],
					"text_width" : 56.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 957.400008500000013, 811.0, 33.166687000000024, 22.0 ],
					"text" : "+~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 722.5, 378.0, 52.0, 22.0 ],
					"text" : "phasor~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 251.5, 574.807561042117868, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 251.5, 611.448330542117674, 32.5, 23.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 145.250020333333509, 611.448330542117674, 52.0, 22.0 ],
					"text" : "store 12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 85.833312999999976, 672.333373999999822, 100.0, 40.0 ],
					"preset_data" : [ 						{
							"number" : 1,
							"data" : [ 6, "obj-13", "gain~", "list", 109, 10.0, 5, "obj-36", "filtergraph~", "nfilters", 1, 9, "obj-36", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-36", "filtergraph~", "params", 0, 584.75469970703125, 1.793768405914307, 0.177161529660225, 5, "obj-41", "filtergraph~", "nfilters", 1, 9, "obj-41", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-41", "filtergraph~", "params", 0, 971.8316650390625, 1.598521709442139, 0.177161529660225, 5, "obj-46", "filtergraph~", "nfilters", 1, 9, "obj-46", "filtergraph~", "setoptions", 0, 4, 1, 0, 0, 8, "obj-46", "filtergraph~", "params", 0, 11662.9765625, 1.198318243026733, 0.946666419506073, 5, "obj-50", "flonum", "float", 1.0, 5, "obj-76", "flonum", "float", 6.0, 5, "obj-86", "slider", "float", 6.0, 5, "obj-90", "slider", "float", 1.0, 5, "obj-92", "flonum", "float", 1.0, 5, "obj-94", "incdec", "float", 1.0, 5, "obj-96", "incdec", "float", 6.0, 5, "obj-97", "incdec", "float", 1.0, 5, "obj-18", "flonum", "float", 4.0, 5, "obj-112", "toggle", "int", 1, 5, "obj-122", "number", "int", 15, 5, "obj-130", "radiogroup", "int", 2, 5, "obj-19", "number", "int", 100, 5, "obj-21", "slider", "float", 0.0 ]
						}
, 						{
							"number" : 2,
							"data" : [ 6, "obj-13", "gain~", "list", 109, 10.0, 5, "obj-36", "filtergraph~", "nfilters", 1, 9, "obj-36", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-36", "filtergraph~", "params", 0, 584.75469970703125, 1.793768405914307, 0.177161529660225, 5, "obj-41", "filtergraph~", "nfilters", 1, 9, "obj-41", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-41", "filtergraph~", "params", 0, 971.8316650390625, 1.598521709442139, 0.177161529660225, 5, "obj-46", "filtergraph~", "nfilters", 1, 9, "obj-46", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-46", "filtergraph~", "params", 0, 133.767791748046875, 1.598521709442139, 0.946666419506073, 5, "obj-50", "flonum", "float", 2.0, 5, "obj-76", "flonum", "float", 566.0, 5, "obj-86", "slider", "float", 566.0, 5, "obj-90", "slider", "float", 2.0, 5, "obj-92", "flonum", "float", 20.0, 5, "obj-94", "incdec", "float", 20.0, 5, "obj-96", "incdec", "float", 6.0, 5, "obj-97", "incdec", "float", 1.0, 5, "obj-18", "flonum", "float", 4.0, 5, "obj-112", "toggle", "int", 1, 5, "obj-122", "number", "int", 15, 5, "obj-130", "radiogroup", "int", 2, 5, "obj-19", "number", "int", 100, 5, "obj-21", "slider", "float", 0.0 ]
						}
, 						{
							"number" : 3,
							"data" : [ 6, "obj-13", "gain~", "list", 109, 10.0, 5, "obj-36", "filtergraph~", "nfilters", 1, 9, "obj-36", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-36", "filtergraph~", "params", 0, 584.75469970703125, 1.793768405914307, 0.177161529660225, 5, "obj-41", "filtergraph~", "nfilters", 1, 9, "obj-41", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-41", "filtergraph~", "params", 0, 971.8316650390625, 1.598521709442139, 0.177161529660225, 5, "obj-46", "filtergraph~", "nfilters", 1, 9, "obj-46", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-46", "filtergraph~", "params", 0, 39.684116363525391, 1.131195187568665, 0.825256824493408, 5, "obj-50", "flonum", "float", 45.0, 5, "obj-76", "flonum", "float", 1718.0, 5, "obj-86", "slider", "float", 1718.0, 5, "obj-90", "slider", "float", 45.0, 5, "obj-92", "flonum", "float", 10.0, 5, "obj-94", "incdec", "float", 10.0, 5, "obj-96", "incdec", "float", 6.0, 5, "obj-97", "incdec", "float", 1.0, 5, "obj-18", "flonum", "float", 4.0, 5, "obj-112", "toggle", "int", 1, 5, "obj-122", "number", "int", 15, 5, "obj-130", "radiogroup", "int", 2, 5, "obj-19", "number", "int", 100, 5, "obj-21", "slider", "float", 0.0 ]
						}
, 						{
							"number" : 9,
							"data" : [ 6, "obj-13", "gain~", "list", 137, 10.0, 5, "obj-36", "filtergraph~", "nfilters", 1, 9, "obj-36", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-36", "filtergraph~", "params", 0, 584.75469970703125, 1.793768405914307, 0.177161529660225, 5, "obj-41", "filtergraph~", "nfilters", 1, 9, "obj-41", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-41", "filtergraph~", "params", 0, 971.8316650390625, 1.598521709442139, 0.177161529660225, 5, "obj-46", "filtergraph~", "nfilters", 1, 9, "obj-46", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-46", "filtergraph~", "params", 0, 3960.910400390625, 1.131195187568665, 0.946666419506073, 5, "obj-50", "flonum", "float", 2.0, 5, "obj-76", "flonum", "float", 3.0, 5, "obj-86", "slider", "float", 3.0, 5, "obj-90", "slider", "float", 2.0, 5, "obj-92", "flonum", "float", 10.0, 5, "obj-94", "incdec", "float", 10.0, 5, "obj-96", "incdec", "float", 6.0, 5, "obj-97", "incdec", "float", 1.0, 5, "obj-18", "flonum", "float", 4.0, 5, "obj-112", "toggle", "int", 1, 5, "obj-122", "number", "int", 15, 5, "obj-130", "radiogroup", "int", 1, 5, "obj-19", "number", "int", 100, 5, "obj-21", "slider", "float", 0.0 ]
						}
, 						{
							"number" : 10,
							"data" : [ 6, "obj-13", "gain~", "list", 137, 10.0, 5, "obj-36", "filtergraph~", "nfilters", 1, 9, "obj-36", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-36", "filtergraph~", "params", 0, 584.75469970703125, 1.793768405914307, 0.177161529660225, 5, "obj-41", "filtergraph~", "nfilters", 1, 9, "obj-41", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-41", "filtergraph~", "params", 0, 971.8316650390625, 1.598521709442139, 0.177161529660225, 5, "obj-46", "filtergraph~", "nfilters", 1, 9, "obj-46", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-46", "filtergraph~", "params", 0, 3960.910400390625, 1.131195187568665, 0.946666419506073, 5, "obj-50", "flonum", "float", 0.0, 5, "obj-76", "flonum", "float", 0.0, 5, "obj-86", "slider", "float", 0.0, 5, "obj-90", "slider", "float", 0.0, 5, "obj-92", "flonum", "float", 10.0, 5, "obj-94", "incdec", "float", 10.0, 5, "obj-96", "incdec", "float", 6.0, 5, "obj-97", "incdec", "float", 1.0, 5, "obj-18", "flonum", "float", 4.0, 5, "obj-112", "toggle", "int", 1, 5, "obj-122", "number", "int", 15, 5, "obj-130", "radiogroup", "int", 1, 5, "obj-19", "number", "int", 400, 5, "obj-21", "slider", "float", 300.0 ]
						}
, 						{
							"number" : 11,
							"data" : [ 6, "obj-13", "gain~", "list", 137, 10.0, 5, "obj-36", "filtergraph~", "nfilters", 1, 9, "obj-36", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-36", "filtergraph~", "params", 0, 584.75469970703125, 1.793768405914307, 0.177161529660225, 5, "obj-41", "filtergraph~", "nfilters", 1, 9, "obj-41", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-41", "filtergraph~", "params", 0, 971.8316650390625, 1.598521709442139, 0.177161529660225, 5, "obj-46", "filtergraph~", "nfilters", 1, 9, "obj-46", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-46", "filtergraph~", "params", 0, 3960.910400390625, 1.131195187568665, 0.946666419506073, 5, "obj-50", "flonum", "float", 1.0, 5, "obj-76", "flonum", "float", 9.0, 5, "obj-86", "slider", "float", 9.0, 5, "obj-90", "slider", "float", 1.0, 5, "obj-92", "flonum", "float", 10.0, 5, "obj-94", "incdec", "float", 10.0, 5, "obj-96", "incdec", "float", 6.0, 5, "obj-97", "incdec", "float", 1.0, 5, "obj-18", "flonum", "float", 4.0, 5, "obj-112", "toggle", "int", 1, 5, "obj-122", "number", "int", 15, 5, "obj-130", "radiogroup", "int", 1, 5, "obj-19", "number", "int", 1000, 5, "obj-21", "slider", "float", 900.0 ]
						}
, 						{
							"number" : 12,
							"data" : [ 6, "obj-13", "gain~", "list", 109, 10.0, 5, "obj-36", "filtergraph~", "nfilters", 1, 9, "obj-36", "filtergraph~", "setoptions", 0, 1, 1, 0, 0, 8, "obj-36", "filtergraph~", "params", 0, 584.75469970703125, 1.793768405914307, 0.177161529660225, 5, "obj-41", "filtergraph~", "nfilters", 1, 9, "obj-41", "filtergraph~", "setoptions", 0, 2, 1, 0, 0, 8, "obj-41", "filtergraph~", "params", 0, 971.8316650390625, 1.598521709442139, 0.177161529660225, 5, "obj-46", "filtergraph~", "nfilters", 1, 9, "obj-46", "filtergraph~", "setoptions", 0, 4, 1, 0, 0, 8, "obj-46", "filtergraph~", "params", 0, 11662.9765625, 1.198318243026733, 0.946666419506073, 5, "obj-50", "flonum", "float", 87.0, 5, "obj-76", "flonum", "float", 976.0, 5, "obj-86", "slider", "float", 976.0, 5, "obj-90", "slider", "float", 87.0, 5, "obj-92", "flonum", "float", 1.0, 5, "obj-94", "incdec", "float", 1.0, 5, "obj-96", "incdec", "float", 6.0, 5, "obj-97", "incdec", "float", 1.0, 5, "obj-18", "flonum", "float", 4.0, 5, "obj-112", "toggle", "int", 1, 5, "obj-122", "number", "int", 15, 5, "obj-130", "radiogroup", "int", 1, 5, "obj-19", "number", "int", 100, 5, "obj-21", "slider", "float", 0.0 ]
						}
 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 974.5, 1203.048095999999987, 83.0, 22.0 ],
					"text" : "loadmess 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"interpinlet" : 1,
					"maxclass" : "gain~",
					"multichannelvariant" : 0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 950.400008500000013, 1246.214722000000165, 124.0, 23.999995999999999 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 957.400008500000013, 1318.381470000000036, 45.0, 45.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 1556.983301166666479, 541.666626000000065, 1382.900008500000013, 541.666626000000065 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 1556.983301166666479, 517.666626000000065, 1587.900008500000013, 517.666626000000065 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"midpoints" : [ 261.0, 652.509784249999711, 95.333312999999976, 652.509784249999711 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 3 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"midpoints" : [ 57.5, 619.5, 95.333312999999976, 619.5 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 846.900008500000013, 1213.464722000000165, 959.900008500000013, 1213.464722000000165 ],
					"order" : 1,
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"midpoints" : [ 846.900008500000013, 1246.381409000000076, 1504.150008499999785, 1246.381409000000076 ],
					"order" : 0,
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"midpoints" : [ 959.900008500000013, 1293.798094000000219, 992.900008500000013, 1293.798094000000219 ],
					"order" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"midpoints" : [ 959.900008500000013, 1293.798094000000219, 966.900008500000013, 1293.798094000000219 ],
					"order" : 1,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 1 ],
					"midpoints" : [ 1446.900008500000013, 758.833313000000089, 981.066695500000037, 758.833313000000089 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 2 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 1 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 1 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 1 ],
					"midpoints" : [ 316.75, 1123.524047999999993, 871.400008500000013, 1123.524047999999993 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 732.0, 413.333313000000032, 634.0, 413.333313000000032 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 1 ],
					"midpoints" : [ 1587.900008500000013, 782.833313000000089, 981.066695500000037, 782.833313000000089 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 1 ],
					"midpoints" : [ 738.90002400000003, 754.666686999999911, 981.066695500000037, 754.666686999999911 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"midpoints" : [ 776.5, 667.666686999999911, 738.90002400000003, 667.666686999999911 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 1 ],
					"midpoints" : [ 1060.883325166666509, 759.166686999999911, 981.066695500000037, 759.166686999999911 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"midpoints" : [ 1097.483301166666479, 684.666686999999911, 1060.883325166666509, 684.666686999999911 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 984.0, 1230.881470000000036, 959.900008500000013, 1230.881470000000036 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 2 ],
					"midpoints" : [ 1240.800032500000043, 1142.357421999999815, 895.900008500000013, 1142.357421999999815 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 1419.900008500000013, 1056.333434999999554, 1240.800032500000043, 1056.333434999999554 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 738.0, 304.5, 837.666687000000024, 304.5 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 634.0, 458.666626000000065, 1556.983301166666479, 458.666626000000065 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 837.666687000000024, 337.5, 776.5, 337.5 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"midpoints" : [ 776.5, 371.0, 732.0, 371.0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"midpoints" : [ 1382.900008500000013, 494.166686999999911, 738.90002400000003, 494.166686999999911 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"midpoints" : [ 1523.150008499999785, 1281.857360999999855, 1504.150008499999785, 1281.857360999999855 ],
					"order" : 1,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"midpoints" : [ 1523.150008499999785, 1264.273987000000034, 1538.900008499999785, 1264.273987000000034 ],
					"order" : 0,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"midpoints" : [ 154.750020333333509, 652.390852271058748, 95.333312999999976, 652.390852271058748 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"midpoints" : [ 966.900008500000013, 948.666686999999911, 316.75, 948.666686999999911 ],
					"order" : 1,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 966.900008500000013, 902.166686999999911, 1240.800032500000043, 902.166686999999911 ],
					"order" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 1 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"midpoints" : [ 908.5, 227.5, 864.900008500000013, 227.5 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"midpoints" : [ 657.5, 216.5, 738.0, 216.5 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"midpoints" : [ 1419.900008500000013, 675.5, 1060.883325166666509, 675.5 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 1587.900008500000013, 601.166626000000065, 1419.900008500000013, 601.166626000000065 ],
					"order" : 1,
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"midpoints" : [ 1587.900008500000013, 601.166626000000065, 1587.900008500000013, 601.166626000000065 ],
					"order" : 0,
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 1693.90000850000024, 530.166626000000065, 1587.900008500000013, 530.166626000000065 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"midpoints" : [ 1587.900008500000013, 668.666626000000065, 1446.900008500000013, 668.666626000000065 ],
					"order" : 1,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"order" : 0,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"midpoints" : [ 1693.90000850000024, 622.666626000000065, 1587.900008500000013, 622.666626000000065 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"midpoints" : [ 1064.5, 217.143974500000013, 864.900008500000013, 217.143974500000013 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"midpoints" : [ 423.5, 217.0, 738.0, 217.0 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"midpoints" : [ 567.083333333333258, 409.833313000000032, 662.0, 409.833313000000032 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"midpoints" : [ 551.083333333333258, 353.0, 567.083333333333258, 353.0 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"midpoints" : [ 503.083333333333258, 351.0, 567.083333333333258, 351.0 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"midpoints" : [ 1112.5, 241.643974500000013, 864.900008500000013, 241.643974500000013 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"midpoints" : [ 613.5, 217.5, 738.0, 217.5 ],
					"source" : [ "obj-97", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "Default",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
