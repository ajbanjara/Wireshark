# Displays the ASCII table in various formats.

This Lua script adds a new GUI Menu to Wireshark that displays the standard ASCII table, and by default the extended ASCII table, in various formats:
- Hexadecimal + Decimal
- Hexadecimal only
- Decimal only
- Octal
- Binary

It can also be invoked by [`tshark`](https://www.wireshark.org/docs/man-pages/tshark.html) as well.  This script was inspired by the [`ascii`](https://man7.org/linux/man-pages/man7/ascii.7.html) command-line tool.

**Installation** - place in plugins directory - see [Lua Support in Wireshark](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm.html)  

[ascii.lua](uploads/0748db71f39020ea014af08824f36ff6/ascii.lua)

**Example** - Display Hexadecimal and Decimal values
![ascii](uploads/367c143f1981834dec76e5b3b1d3b9b8/ascii.jpg)

## Tshark Support

To make use of the ASCII Table from `tshark`, first set the `PRINT_ASCII` environment variable:
- `PRINT_ASCII=HEX` - Print only the hexadecmial values
- `PRINT_ASCII=DEC` - Print only the decimal values
- `PRINT_ASCII=OCT` - Print the octal values
- `PRINT_ASCII=BIN` - Print the binary values
- `PRINT_ASCII=YES` - Print both hexadecimal and decimal values (You can actually just set `PRINT_ASCII` to anything and this will work, as this is the default format.)
- `PRINT_ASCII=` - Don't print the ASCII table

***Tshark Example*** - Print the octal values of the ASCII table

```
set PRINT_ASCII=BIN
"C:\Program Files\Wireshark\tshark.exe" -2G help 2> NUL

  Oct       Oct       Oct       Oct       Oct       Oct       Oct       Oct
    0 NUL    20 DLE    40        60 0     100 @     120 P     140 `     160 p
    1 SOH    21 DC1    41 !      61 1     101 A     121 Q     141 a     161 q
    2 STX    22 DC1    42 "      62 2     102 B     122 R     142 b     162 r
    3 ETX    23 DC1    43 #      63 3     103 C     123 S     143 c     163 s
    4 EOT    24 DC1    44 $      64 4     104 D     124 T     144 d     164 t
    5 ENQ    25 NAK    45 %      65 5     105 E     125 U     145 e     165 u
    6 ACK    26 SYN    46 &      66 6     106 F     126 V     146 f     166 v
    7 BEL    27 ETB    47 '      67 7     107 G     127 W     147 g     167 w
   10 BS     30 CAN    50 (      70 8     110 H     130 X     150 h     170 x
   11 HT     31 EM     51 )      71 9     111 I     131 Y     151 i     171 y
   12 LF     32 SUB    52 *      72 :     112 J     132 Z     152 j     172 z
   13 VT     33 ESC    53 +      73 ;     113 K     133 [     153 k     173 {
   14 FF     34 FS     54 ,      74 <     114 L     134 \     154 l     174 |
   15 CR     35 GS     55 -      75 =     115 M     135 ]     155 m     175 }
   16 SO     36 RS     56 .      76 >     116 N     136 ^     156 n     176 ~
   17 SI     37 US     57 /      77 ?     117 O     137 _     157 o     177 ⌂

Extended ASCII:
  Oct       Oct       Oct       Oct       Oct       Oct       Oct       Oct
  200 Ç     220 É     240 á     260 ░     300 └     320 ╨     340 α     360 ≡
  201 ü     221 æ     241 í     261 ▒     301 ┴     321 ╤     341 ß     361 ±
  202 é     222 Æ     242 ó     262 ▓     302 ┬     322 ╥     342 Γ     362 ≥
  203 â     223 ô     243 ú     263 │     303 ├     323 ╙     343 π     363 ≤
  204 ä     224 ö     244 ñ     264 ┤     304 ─     324 ╘     344 Σ     364 ⌠
  205 à     225 ò     245 Ñ     265 ╡     305 ┼     325 ╒     345 σ     365 ⌡
  206 å     226 û     246 ª     266 ╢     306 ╞     326 ╓     346 µ     366 ÷
  207 ç     227 ù     247 º     267 ╖     307 ╟     327 ╫     347 τ     367 ≈
  210 ê     230 ÿ     250 ¿     270 ╕     310 ╚     330 ╪     350 Φ     370 °
  211 ë     231 Ö     251 ⌐     271 ╣     311 ╔     331 ┘     351 Θ     371 ∙
  212 è     232 Ü     252 ¬     272 ║     312 ╩     332 ┌     352 Ω     372 ·
  213 ï     233 ¢     253 ½     273 ╗     313 ╦     333 █     353 δ     373 √
  214 î     234 £     254 ¼     274 ╝     314 ╠     334 ▄     354 ∞     374 ⁿ
  215 ì     235 ¥     255 ¡     275 ╜     315 ═     335 ▌     355 φ     375 ²
  216 Ä     236 ₧     256 «     276 ╛     316 ╬     336 ▐     356 ε     376 ■
  217 Å     237 ƒ     257 »     277 ┐     317 ╧     337 ▀     357 ∩     377 NBSP
```

