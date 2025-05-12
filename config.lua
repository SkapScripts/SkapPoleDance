Config = {}

Config.UseTarget = false -- true = use qb-target, false = use 'E'-button

Config.Poles = {
    {
        coords = vector3(113.83, -1295.56, 22.08),
        heading = 0.0,
        label = "Pole 1",
        jobs = { "vanillaunicorn" } 
    },
    {
        coords = vector3(106.15, -1299.94, 22.08),
        heading = 306.09,
        label = "Pole 2",
        jobs = { "vanillaunicorn" }
    },
    {
        coords = vector3(104.42, -1288.08, 22.08),
        heading = 0.0,
        label = "Pole 3",
        jobs = { "vanillaunicorn" }
    },
    {
        coords = vector3(105.85, -1280.34, 22.92),
        heading = 180.0,
        label = "Dance Place 1",
        jobs = { "vanillaunicorn" }
    },
    {
        coords = vector3(97.00, -1285.29, 22.92),
        heading = 180.0,
        label = "Dance Place 2",
        jobs = { "vanillaunicorn" }
    },
    {
        coords = vector3(90.95, -1293.61, 21.91),
        heading = 121.04,
        label = "Dance on Table 1",
        jobs = { "vanillaunicorn" }
    },
    {
        coords = vector3(87.79, -1288.23, 21.91),
        heading = 121.04,
        label = "Dance on Table 2",
        jobs = { "vanillaunicorn" }
    },
    {
        coords = vector3(93.88, -1298.91, 21.91),
        heading = 121.04,
        label = "Dance on Table 3",
        jobs = { "vanillaunicorn" }
    },
    {
        coords = vector3(97.11, -1304.33, 21.91),
        heading = 121.04,
        label = "Dance on Table 4",
        jobs = { "vanillaunicorn" }
    }
}

Config.Dances = {
        { label = "Pole Dance 1", animDict = "mini@strip_club@pole_dance@pole_dance1", anim = "pd_dance_01" },
        { label = "Pole Dance 2", animDict = "mini@strip_club@pole_dance@pole_dance2", anim = "pd_dance_02" },
        { label = "Pole Dance 3", animDict = "mini@strip_club@pole_dance@pole_dance3", anim = "pd_dance_03" },
    
        { label = "Strip Club Dance A", animDict = "mini@strip_club@private_dance@part1", anim = "priv_dance_p1" },
        { label = "Strip Club Dance B", animDict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2" },
        { label = "Strip Club Dance C", animDict = "mini@strip_club@private_dance@part3", anim = "priv_dance_p3" },
    
        { label = "Seductive Dance", animDict = "switch@trevor@annoys_sunbathers", anim = "trev_annoys_sunbathers_loop_girl" },
        { label = "Sexy Idle Dance", animDict = "mini@strip_club@idles@stripper", anim = "stripper_idle_02" },
        { label = "Lap Dance Style", animDict = "mp_am_stripper", anim = "lap_dance_girl" },
 
}
