pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init()
    --this will clear the screen
    cls(0)
    shipx = 64
    shipy = 64

    shipsx = 0
    shipsy = 0

    shipspr = 2
    flamespr = 5

    bulx = 64
    buly = -10

    muzzle = 0
end

function _update()
    --controls
    shipsx = 0
    shipsy = 0
    shipspr = 2

    if btn(0) then
        shipsx = -2
        shipspr = 1
    end
    if btn(1) then
        shipsx = 2
        shipspr = 3
    end
    if btn(2) then
        shipsy = -2
    end
    if btn(3) then
        shipsy = 2
    end
    if btnp(5) then
        bulx = shipx
        buly = shipy - 3
        sfx(0)
        muzzle = 6
    end

    --moving the ship
    shipx = shipx + shipsx
    shipy = shipy + shipsy

    --move the bullet
    buly = buly - 4

    --animate flame
    flamespr = flamespr + 1
    if flamespr > 9 then
        flamespr = 5
    end

    --animate mullze flash
    if muzzle > 0 then
        muzzle = muzzle - 1
    end

    --checking if we hit the edge
    if shipx > 120 then
        shipx = 0
    end
    if shipx < 0 then
        shipx = 120
    end
end

function _draw()
    cls(0)
    spr(shipspr, shipx, shipy)
    spr(flamespr, shipx, shipy + 8)

    spr(16, bulx, buly)

    if muzzle > 0 then
        circfill(shipx + 3, shipy - 2, muzzle, 7)
    end
end

__gfx__
00000000000220000002200000022000000000000000000000000000000000000000000000000000ccccccccccccccccc666cccc7777766c6cccccccccccccc0
000000000028820000288200002882000000000000077000000770000007700000c77c0000077000ccccccccccccccccc777cccc7777776c776cccccccccccc0
007007000028820000288200002882000000000000c77c000007700000c77c000cccccc000c77c00cccccccc77cccccc67776cccccc677ccc77cc777ccccccc0
0007700000288e2002e88e2002e882000000000000cccc00000cc00000cccc0000cccc0000cccc00cccc6ccc77cccccc77777cccccc776ccc6777776cc6cccc0
00077000027c88202e87c8e202887c2000000000000cc000000cc000000cc00000000000000cc000ccc67ccc77cccccc77c77ccccc677ccccc77776ccc76ccc0
007007000211882028811882028811200000000000000000000cc000000000000000000000000000ccc77ccc77ccccc776c776cccc776cccccc776cccc77ccc0
00000000025582200285582002285520000000000000000000000000000000000000000000000000ccc77ccc77ccccc7766777ccc677ccccccc77ccccc77ccc0
00000000002992000029920000299200000000000000000000000000000000000000000000000000ccc77ccc77cccc67777777ccc776ccccccc77ccccc77ccc0
09999000009999000000000000000000000000000330033003300330033003300330033000000000ccc77ccc77666c777666776c7777777cccc776cccc77ccc0
9977990009aaaa9000000000000000000000000033b33b3333b33b3333b33b3333b33b3300000000ccc77ccc77777677cccc676c7777777cccc776cccc77ccc0
9a77a9009aa77aa90000000000000000000000003bbbbbb33bbbbbb33bbbbbb33bbbbbb300000000ccc77ccc7666666cccccccccccccccccccc66ccccc77ccc0
9a77a9009a7777a90000000000000000000000003b7717b33b7717b33b7717b33b7717b300000000ccc77ccccccccccccccccccccccccccccccccccccc77ccc0
9a77a9009a7777a90000000000000000000000000b7117b00b7117b00b7117b00b7117b000000000ccc77cccccccccccc66677cc77cccc666cc666cccc77ccc0
99aa99009aa77aa90000000000000000000000000037730000377300003773000037730000000000ccc77ccc777777ccc77777cc776ccc776c77777ccc77ccc0
09aa900009aaaa900000000000000000000000000303303003033030030330300303303000000000ccc77ccc7777777cc676cccc677cc677cc77667ccc77ccc0
00990000009999000000000000000000000000000300003030000003030000300330033000000000ccc676cc77ccc777c676ccccc77cc776c677cccccc77ccc0
00ee000000ee00000077000000000000000000000880088008800880000000000000000000000000ccc676cc776cc677c67777ccc77cc77cc67776ccc676ccc0
0e22e0000e88e00007cc700000000000000000008888888880088008000000000000000000000000ccc676cc776ccc77c67777ccc676676ccc67777cc676ccc0
e2e82e00e87e8e007c77c70000000000000000008888888880000008000000000000000000000000ccc677cc676cc677c676cccccc7777cccccc677cc676ccc0
e2882e00e8ee8e007c77c70000000000000000008888888880000008000000000000000000000000cccc77cc676c6776c677cccccc7777ccccccc77cc77cccc0
0e22e0000e88e00007cc700000000000000000000888888008000080000000000000000000000000cccc77cc6777777cc677776ccc677cccc776777cc77cccc0
00ee000000ee00000077000000000000000000000088880000800800000000000000000000000000cccc776cc77776ccc66666ccccc76cccc67777ccc77cccc0
00000000000000000000000000000000000000000008800000088000000000000000000000000000ccccccccccccccccccccccccccccccccccccccccccccccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccc666666666666666666666ccccccccccccc0
000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000666667777777777777777777777777777777777777766660
000b0bb000000000000000000000000000000000000000000000000000000000000000000000000077777777777766677667766c6776cc776776777777777770
00b00b00000000000000000000000000000000000000000000000000000000000000000000000000c777776c6776ccc77cc67ccccc7ccc76c67cc7cc7cc77760
00b00880000000000000000000000000000000000000000000000000000000000000000000000000c77777ccc77cc7776ccc76c76c6cc67cc66cc76ccc6777c0
08808788000000000000000000000000000000000000000000000000000000000000000000000000c67777c6c67c7777cc6c76c77c6ccc7cccccc77cc67776c0
87880888000000000000000000000000000000000000000000000000000000000000000000000000cc7777cccc7cc667cccc66c6cc7cc66c7cc6c676c7777cc0
88880880000000000000000000000000000000000000000000000000000000000000000000000000ccc77ccc6c67ccc6c676c6ccc77ccc6c7c67c67cc777ccc0
08800000000000000000000000000000000000000000000000000000000000000000000000000000ccc67c67766776777777777777777777777767766776ccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000cccc777777777777777777777777777777777777777cccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000ccccc77766666ccccccccccccccccccccc66666777ccccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccccccccccccccccccccccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000cccccccccccccc7777ccccccccccc7777cccccccccccccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccc67776ccccccc67776ccccccccccccccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccc677776cc67776ccccccccccccccccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccc677777776ccccccccccccccccccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccc67776ccccccccccccccccccccc0
00000ee00000bbbbbbbb00000ee0000000000ee00000bbbbbbbb00000ee0000000000ee00000bbbbbbbb00000ee0000000000ee00000bbbbbbbb00000ee00000
ee0008e7e1bbbbbaabbbbb1e7e8000eeee0008e7e1bbbbbaabbbbb1e7e8000eeee0008e7e1bbbbbaabbbbb1e7e8000eeee0008e7e1bbbbbaabbbbb1e7e8000ee
e7e0138873bbbaa77aabbb3788310e7ee7e0138873bbbaa77aabbb3788310e7ee7e0138873bbbaa77aabbb3788310e7ee7e0138873bbbaa77aabbb3788310e7e
8e783b333bbabaa77aababb333b387e88e783b333bbabaa77aababb333b387e88e783b333bbabaa77aababb333b387e88e783b333bbabaa77aababb333b387e8
08e813bbbbbbbba77abbbbbbbb318e8008e813bbbbbbbbbaabbbbbbbbb318e8008e813bbbbbbbbbaabbbbbbbbb318e8008e813bbbbbbbbbaabbbbbbbbb318e80
088811bbbbbbbbbaabbbbbbbbb11888008881133b33bbbbbbbbbb33b3311888008881133b33bbbbbbbbbb33b3311888008881133b33bbbbbbbbbb33b33118880
0011133bbbbb33bbbb33bbbbb331110000113b11bbb3333333333bbb11b3110000113b11bbb3333333333bbb11b3110000113b11bbb3333333333bbb11b31100
00bb113bbabbb33bb33bbbabb311bb0000bb13bb13bbb333333bbb31bb31bb0000bb13bb13bbb333333bbb31bb31bb0000bb13bb13bbb333333bbb31bb31bb00
bb333113bbabbbbbbbbbbabb311333bbbb3331333333bba77abb3333331333bbbb3331333333bba77abb3333331333bbbb3331333333bba77abb3333331333bb
bbbb31333bbaa7bbbb7aabb33313bbbbb7713ee6633333bbbb3333366ee3177bb7713ee6633333bbbb3333366ee3177bb7713ee6633333bbbb3333366ee3177b
3b333313333bbb7777bbb333313333b337113eefff663333333366fffee3117337113eefff663333333366fffee3117337113eefff663333333366fffee31173
c333333bb33333bbbb33333bb333333cc3773efff77f17711111f77fffe3773cc3773efff77f17711111f77fffe3773cc3773efff77f17711111f77fffe3773c
0c3bb3b3bbb3333333333bbb3b3bb3c00c3b3eff777717711c717777ffe3b3c00c3b3eff777717711c717777ffe3b3c00c3b3eff777717711c717777ffe3b3c0
00c1bb3b33bbbb3333bbbb33b3bb1c0000c1b3ef7777711cc7177777fe3b1c0000c1b3ef7777711cc7177777fe3b1c0000c1b3ef7777711cc7177777fe3b1c00
00013bb3bb333bbbbbb333bb3bb3100000013b3eff777711117777ffe3b3100000013b3eff777711117777ffe3b3100000013b3eff777711117777ffe3b31000
0331c3bb33aaa333333aaa33bb3c13300331c3b3eef7777777777fee3b3c13300031c3b3eef7777777777fee3b3c13000031c3b3eef7777777777fee3b3c1300
3bb31c3bbb333a7777a333bbb3c13bb33bb31c3b33eee777777eee33b3c13bb303b31c3b33eee777777eee33b3c13b30003b1c3b33eee777777eee33b3c1b300
3ccc13c3bbbbb333333bbbbb3c31ccc33ccc13c3bb333eeeeee333bb3c31ccc33bcc13c3bb333eeeeee333bb3c313cb303bc13c3bb333eeeeee333bb3c31cb30
00003b3c33bbbba77abbbb33c3b3000000003b3c33bbb333333bbb33c3b300003c003b3c33bbb333333bbb33c3b300cc03c0333c33bbb333333bbb33c3330c30
0003b3ccc333bbbbbbbb333ccc3b30000003b3ccc333bba77abb333ccc3b300000003b3cc333bba77abb333cc3b3000000003b3cc333bba77abb333cc3b30000
00033c003bc33bbbbbb33cb300c3300000033c003bc33bbbbbb33cb300c33000000033c03bc33bbbbbb33cb30c33000000003bc03bc33bbbbbb33cb30cb30000
0003c0003b3c3cb22bc3c3b3000c30000003c0003b3c3cb22bc3c3b3000c300000003c003b3c3cb22bc3c3b300c30000000003c0c3bc3cb22bc3cb3c0c300000
0000000033c0cc2112cc0c33000000000000000033c0cc2112cc0c330000000000000000c330cc2112cc033c00000000000000000c30cc2112cc03c000000000
00000000cc0000c33c0000cc0000000000000000cc0000c33c0000cc00000000000000000cc000c33c000cc0000000000000000000cc00c33c00cc0000000000
00000000000000000000000000070000020000200200002002000020020000205555555555555555555555555555555502222220022222200222222002222220
000bb000000bb0000007700000077000022ff220022ff220022ff220022ff2200578875005788750d562465d0578875022e66e2222e66e2222e66e2222e66e22
0066660000666600606666066066660602ffff2002ffff2002ffff2002ffff2005624650d562465d05177150d562465d27761772277617722776177227716772
0566665065666656b566665bb566665b0077d7000077d700007d77000077d700d517715d051771500566865005177150261aa172216aa162261aa612261aa162
65637656b563765b056376500563765008577580085775800857758008577580056686500566865005d24d50056686502ee99ee22ee99ee22ee99ee22ee99ee2
b063360b006336000063360000633600080550800805508008055080080550805d5245d505d24d500505505005d24d5022299222229999222229922222299222
006336000063360000633600006336000c0000c007c007c007c00c7007c007c05005500505055050050000500505505020999902020000202099990202999920
0006600000066000000660000006600000c7c7000007c0000077cc000007c000dd0000dd0dd00dd005dddd500dd00dd022000022022002202200002202200220
00ff880000ff88000000000000000000200000020200002000000000000000003350053303500530000000000000000000000000000000000000000000000000
0888888008888880000000000000000022000022220000220000000000000000330dd033030dd030005005000350053000000000000000000000000000000000
06555560076665500000000000000000222222222222222200000000000000003b8dd8b3338dd833030dd030030dd03003e33e300e33e330033e333003e333e0
6566665576555565000000000000000028222282282222820000000000000000032dd2300b2dd2b0038dd830338dd833e33e33e333e33e333e33e333e33e333e
57655576555776550000000000000000288888822888888200000000000000003b3553b33b3553b3033dd3300b2dd2b033300333333003333330033333300333
0655766005765550000000000000000028788782287887820000000000000000333dd333333dd33303b55b303b3553b3e3e3333bbe33333ebe3e333be3e3333b
0057650000655700000000000000000028888882080000800000000000000000330550330305503003bddb30333dd3334bbbbeb44bbbebb44bbbbeb44bbbebe4
00065000000570000000000000000000080000800000000000000000000000000000000000000000003553000305503004444440044444400444444004444440
0066600000666000006660000068600000888000002222000022220000222200002222000cccccc00c0000c00000000000000000000000000000000000000000
055556000555560005585600058886000882880002eeee2002eeee2002eeee2002eeee20c0c0c0ccc000000c0000000000000000000000000000000000000000
55555560555855605588856058828860882228802ee77ee22ee77ee22eeeeee22ee77ee2c022220ccc2c2c0cc022220c00222200000000000000000000000000
55555550558885505882885088222880822222802ee77ee22ee77ee22ee77ee22ee77ee2cc2cac0cc02aa20cc0cac2ccc02aa20c000000000000000000000000
15555550155855501588855018828850882228802eeeeee22eeeeee22eeeeee22eeeeee2c02aa20cc0cac2ccc02aa20ccc2cac0c000000000000000000000000
01555500015555000158550001888500088288002222222222222222222222222222222200222200c022220ccc2c2c0cc022220c000000000000000000000000
0011100000111000001110000018100000888000202020200202020220202020020202020000000000000000c000000cc0c0c0cc000000000000000000000000
00000000000000000000000000000000000000002000200002000200002000200002000200000000000000000c0000c00cccccc0000000000000000000000000
000880000009900000089000000890000000000001111110011111100000000000d89d0000189100001891000019810000005500000050000005000000550000
706666050766665000676600006656000000000001cccc1001cccc10000000000d5115d000d515000011110000515d0000055000000550000005500000055000
1661c6610161661000666600001666000000000001cccc1001cccc1000000000d51aa15d0151a11000155100011a151005555550055555500555555005555550
7066660507666650006766000066560000000000017cc710017cc71000000000d51aa15d0d51a15000d55d00051a15d022222222222222222222222222222222
0076650000766500007665000076650000000000017cc710017cc710000000006d5005d6065005d0006dd6000d50056026060602260606022666666226060602
000750000007500000075000000750000000000001111110011111100000000066d00d60006d0d600066660006d0d60020000002206060622222222020606062
00075000000750000007500000075000000000001100001101100110000000000760067000660600000660000060660020606062222222200000000022222220
00060000000600000006000000060000000000001100001101100110000000000070070000070700000770000070700022222220000000000000000000000000
0007033000700000007d330003330333000000000022220000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d3300000d33000028833003bb3bb3000000000888882000000000000000000000000000000000000000000000000000000000000000000000000000000000
0778827000288330071ffd1000884200002882000888882000288200000000000000000000000000000000000000000000000000000000000000000000000000
071ffd10077ffd700778827008ee8e800333e33308ee8e80088ee883000000000000000000000000000000000000000000000000000000000000000000000000
00288200071882100028820008ee8e8003bb4bb308ee8e8008eeee83000000000000000000000000000000000000000000000000000000000000000000000000
07d882d00028820007d882d00888882008eeee800088420008eeee80000000000000000000000000000000000000000000000000000000000000000000000000
0028820007d882d000dffd0008888820088ee88003bb3bb3088ee880000000000000000000000000000000000000000000000000000000000000000000000000
00dffd0000dffd000000000000222200002882000333033300288200000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000077777777777777777777777777777777777777777777777777777777777777777777777777777777777777700000
00000000000000000000000000000000007777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777000
0000149aa94100000000012222100000077778888778877778878888887888887777888887788777788777778888877777788887777887777788788888777700
00019777aa921000000029aaaa920000077888888878877778878888887888888777888888778877887777778888887778888888877888777888788888877700
0d09a77a949920d00d0497777aa920d077788e778878877778878877777887788877887788878877887777778877887778877888877888777888788778877770
0619aaa9422441600619a779442941607788e7777778877778878877777887778877887778877888877777778877887788777888887888878888788778877770
07149a922249417006149a9442244160778877777778888888878888887887788877887788877888877777778888877788778888887888878888788888777770
07d249aaa9942d7006d249aa99442d60778877777778888888878888887888888777888888777788777777778888887788888888887887888788788888877770
067d22444422d760077d22244222d7707788e7777778877778878877777888887777888887777788777777778877e8878888888888788788878878877e887770
0d666224422666d00d776249942677d077788e778878877778878877777887888777887888777788777777778877788778888888877887787788788777887770
066d51499415d66001d1529749251d10077888888878877778878888887887788877887788877788777777778888888778888888877887787788788888887700
0041519749151400066151944a1516600777788887788777788788888878877788878877788877887777777788888e7777788887777887777788788888e77700
00a001944a100a0000400149a4100400007777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777000
00000049a400090000a0000000000a00000077777777777777777777777777777777777777777777777777777777777777777777777777777777777777700000
00000000000000000000000000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100003455032550305502e5502b550285502555022550205501b55018550165501355011550010000f5500c5500a5500855006550055500455003550015500055000000000000000000000000000100000000
