local I=15
local D=0

local punkty={
    {2228.95,-1150.58,1029.80},
    {2241.02,-1157.32,1029.80},
    {2243.91,-1160.00,1029.80},
    {2238.51,-1159.66,1029.80},
    {2240.91,-1167.27,1029.80},
    {2235.73,-1168.90,1029.80},
    {2241.46,-1181.70,1029.80},
    {2248.33,-1186.80,1029.80},
    {2244.66,-1181.86,1032.89},
    {2236.35,-1188.54,1029.80},
    {2225.73,-1188.40,1029.80},
    {2225.14,-1180.32,1029.80},
    {2209.38,-1192.17,1029.80},
    {2204.17,-1187.92,1029.80},
    
}

for i,v in ipairs(punkty) do
    createFire(v[1],v[2],v[3],math.random(5,15))
end