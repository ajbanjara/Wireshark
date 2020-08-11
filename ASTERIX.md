# ASTERIX

ASTERIX is a European aviation network protocol.

## History

Until the 1980s, every National Administration developed its own format for delivering radar data to Air Traffic Control Centres. This resulted in duplicate effort and made exchange of radar data across borders a complicated issue. The need for a common European data format became apparent and an example of what a standard format could look like was presented by Maastricht UAC in 1984.

The All purpose STructured Eurocontrol [SuRveillance](/SuRveillance) Information eXchange format (ASTERIX) was born, the ASTERIX Users Group was created to work on a common European definition which led to ASTERIX's official approval by the RSSP in its 15th Meeting held on 1/4 July 1986.

In 1988, the ASTERIX Manual was presented, describing the initial structure of ASTERIX and providing a set of "data items" to cover monoradar and weather data.

This initial structure was enhanced in 1991 to provide more flexibility, and the ASTERIX Manual was replaced by the first draft of what is now the ASTERIX Structure Document which is the Standard Document to be used for implementing ASTERIX (this document can be found under section ASTERIX Categories).

In 1994, the responsibilities of the former RSSP were taken over by the Surveillance Team, and the Surveillance Task Force for Radar Data Exchange (STFRDE) was created to continue the work of the ASTERIX Users Group (now renamed ASTERIX Maintenance Group). Since then, the application domain of ASTERIX has constantly expanded, and ASTERIX has now been adopted world-wide as the standard format for exchanging data from primary, secondary, monopulse, Mode S and weather radars, and also for carrying multiradar data, data-link, SMGCS, control & monitoring, etc...

Source: <http://www.eurocontrol.int/services/asterix>

## Protocol dependencies

  - [UDP](/UDP): Typically, ASTERIX uses [UDP](/UDP) as its transport protocol. It does not appear to have a well-known port number.

## Example traffic

    ASTERIX packet, Category 062
        Category: 62
        Length: 786
        Asterix message, #01, length: 98
            FSPEC
            010, Data Source Identifier
                SAC: 147
                SIC: 100
            015, Service Identification
                SI: 2
            070, Time Of Track Information
                [s]: 46011,320
            105, Calculated Position In WGS-84 Co-ordinates
                LAT[deg]: 45,5832624435425
                LON[deg]: 16,8090444803238
            100, Calculated Track Position (Cartesian)
                X[m]: 180193
                Y[m]: -43716
            185, Calculated Track Velocity (Cartesian)
                Vx[m]: 172,5
                Vy[m]: -123,75
            060, Track Mode 3/A Code
                ..0. .... .... .... = CH: No Change (0)
                .... 0100 1001 0101 = SQUAWK: 02225
            380, Aircraft Derived Data
                FSPEC
                #1: Target Address
                    Aircraft Address: 0x4ba742
                #2: Target Identification
                    Aircraft Identification: BER3044
                #3: Magnetic Heading
                    MH[deg]: 118,30078125
                #5: True Airspeed
                    TAS[knot]: 444
                #10: Communications/ACAS Capability and Flight Status reported by Mode-S
                    000. .... .... .... = COM: No communications capability (surveillance only) (0)
                    ...0 00.. .... .... = STAT: No alert, no SPI, aircraft airborne (0)
                    .... .... 1... .... = SSC: Yes (1)
                    .... .... .1.. .... = ARC: 25 ft resolution (1)
                    .... .... ..1. .... = AIC: Yes (1)
                    .... .... ...1 .... = B1A: 1
                    .... .... .... 0110 = B1B: 6
            040, Track Number
                TN: 4154
            080, Track Status
                0... .... = MON: Multisensor (0)
                .0.. .... = SPI: default value (0)
                ..0. .... = MRH: Barometric altitude (Mode C) more reliable (0)
                ...1 10.. = SRC: default height (6)
                .... ..0. = CNF: Confirmed track (0)
                .... ...1 = FX: Extension into next extent (1)
                0... .... = SIM: Actual track (0)
                .0.. .... = TSE: default value (0)
                ..0. .... = TSB: default value (0)
                ...0 .... = FPC: Not flight-plan correlated (0)
                .... 0... = AFF: default value (0)
                .... .0.. = STP: default value (0)
                .... ..1. = KOS: Background service used (1)
                .... ...1 = FX: Extension into next extent (1)
                0... .... = AMA: track not resulting from amalgamation process (0)
                .00. .... = MD4: No Mode 4 interrogation (0)
                ...0 .... = ME: default value (0)
                .... 0... = MI: default value (0)
                .... .00. = MD5: No Mode 5 interrogation (0)
                .... ...1 = FX: Extension into next extent (1)
                0... .... = CST: Default value (0)
                .1.. .... = PSR: Age of the last received PSR track update is higher than system dependent threshold (1)
                ..0. .... = SSR: Default value (0)
                ...0 .... = MDS: Default value (0)
                .... 1... = ADS: Age of the last received ADS-B track update is higher than system dependent threshold (1)
                .... .0.. = SUC: Default value (0)
                .... ..0. = AAC: Default value (0)
                .... ...0 = FX: End of data item (0)
            200, Mode of Movement
                00.. .... = TRANS: Constant Course (0)
                ..00 .... = LONG: Constant Groundspeed (0)
                .... 00.. = VERT: Level (0)
                .... ..0. = ADF: No altitude discrepancy (0)
            295, Track Data Ages
                FSPEC
                #1: Measured Flight Level Age
                    MFL[s]: 2,75
                #4: Mode 3/A Age
                    MDA[s]: 2,75
            136, Measured Flight Level
                Measured Flight Level[FL]: 390
            340, Measured Information
                FSPEC
                #1: Sensor Identification
                    SAC: 34
                    SIC: 26
                #2: Measured Position
                    RHO[NM]: 140,4921875
                    THETA[deg]: 94,833984375
                #4: Last Measured Mode C Code
                    0... .... .... .... = V: Code validated (0)
                    .0.. .... .... .... = G: Default (0)
                    HEIGHT[FL]: 390
                #5: Last Measured Mode 3/A Code
                    0... .... .... .... = V: Code validated (0)
                    .0.. .... .... .... = G: Default (0)
                    ..0. .... .... .... = L: MODE 3/A code as derived from the reply of the transponder (0)
                    .... 0100 1001 0101 = SQUAWK: 02225
                #6: Report Type
                    010. .... = TYP: Single SSR detection (2)
                    ...0 .... = SIM: Actual target report (0)
                    .... 0... = RAB: Report from target transponder (0)
                    .... .0.. = TST: Real target report (0)
            Special Purpose Field

## Wireshark

ASTERIX dissector is now part of the Wireshark package. The code is written to support any ASTERIX category. However, not all categories are being dissected at present. To properly dissect the category the program needs its definition. Authors did not include all categories in the source because they don't have the access to samples of each category. To enter definition without ability to check and debug seems useless.

To add a category there is no need to change dissecting code. Only definition of the category has to be put in source so dissecting code will be able to use it for dissecting. Anybody who wants the dissector to be able to dissect other categories too, is welcome to enter definition in the source. We can also input definitions if you provide sample of traffic to be able to see the results and debug the code.

There is also a plugin (but never submitted to Wireshark for inclusion). There is no information whether it is being maintained. See [here](http://www.recherche.enac.fr/asterix/doku.php) for more information (most of the pages are in French but a few are in English).

## Preference Settings

The support for various Asterix versions can be set in preference settings. The dissector can not guess which version of asterix category is used. User has to set the preferences for Asterix version to be used in dissector in Edit-\>Preferences-\>Protocols-\>ASTERIX.

## Example capture file

Sample [file](uploads/__moin_import__/attachments/ASTERIX/sample.pcap "file").

## Display Filter

Filter can be used to display asterix packets. For instance `asterix.category == 62` displays only messages with category 62.

Every field has a defined name, so some more advanced filtering can be done. For instance:

  - Packets with Field \#15 in Item 380 present for category 062 `asterix.062_380_15`

  - Packets with aircraft having roll angle higher that 15° `asterix.062_380_15_ROLL > 15 || asterix.062_380_15_ROLL < -15`

  - Packets with callsign ADR123 `asterix.AI == "ADR123"` (some of the fields don't have category number in the name because they are used in many categories)

Field names are displayed in the status bar when selected. Go to the field first and see how is it called. For categories with more versions some fields have version number in the identifier. Some fields common to many categories don't have category number in the name (asterix.SAC, asterix.SIC, etc.).

## Capture Filter

You cannot directly filter ASTERIX protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the ASTERIX traffic over port (8600):

``` 
 udp port 8600
```

## External links

  - <http://www.eurocontrol.int/services/asterix>

  - [alternative external ASTERIX plugin main page](http://www.recherche.enac.fr/asterix/doku.php)

## Discussion

It is interesting to note that the developers of the (external) ASTERIX plugin developed (yet another) code generator to generate the dissector.

---

Imported from https://wiki.wireshark.org/ASTERIX on 2020-08-11 23:11:21 UTC
