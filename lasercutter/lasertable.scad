width = 330.0;
height = 150.0;
depth = 230.0;
frame_thickness = 10.0;
frame_width = 20.0;
pillar_thickness = frame_width / 2;
cellsize = 9.0;
cellthickness = 1.0;
mesh_offset = 10;
table_thickness = 5.0;
table_width = width - 2 * frame_width;
table_depth = depth - 2 * frame_width;
guide_thickness = 5;
mesh_width = table_width - mesh_offset * 2;
mesh_depth = table_depth - mesh_offset * 2;
module frame()
{
    cube(size = [width, frame_width, frame_thickness]);
    translate([0, depth - frame_width, 0])
    {
        cube(size = [width, frame_width, frame_thickness]);
    }
    translate([0, frame_width, 0])
    {
        cube(size = [frame_width, depth - 2 * frame_width, frame_thickness]);
    }
    translate([width - frame_width, frame_width, 0])
    {
        cube(size = [frame_width, depth - 2 * frame_width, frame_thickness]);
    }
}


module table()
{
    difference()
    {
        cube(size = [table_width, table_depth, table_thickness]);

        depthoffset = (mesh_depth - floor(mesh_depth / cellsize / 1.733) * cellsize * 1.733) / 2;

        translate([mesh_offset, mesh_offset, 0])
        {
            translate([cellsize / 2 + (mesh_width - (floor((mesh_width / cellsize)))*cellsize) / 2 ,
                       cellsize / 2 + depthoffset,
                       -table_thickness / 2])
            {
                for(i = [0:floor(mesh_width / cellsize) - 1])
                {
                    for(j = [0:floor(mesh_depth / cellsize / 1.733) - 1])
                    {
                        translate([i * cellsize, j * cellsize * 1.733, 0])
                        {
                            rotate([0, 0, 90])
                            cylinder(d = cellsize / 0.866 - cellthickness , h = table_thickness * 2, $fn = 6);
                        }
                    }
                }
            }
            translate([cellsize + (mesh_width - (floor((mesh_width / cellsize)))*cellsize) / 2 ,
                       cellsize + cellsize / 2.73 + depthoffset,
                       -table_thickness / 2])
            {
                for(i = [0:floor(mesh_width / cellsize) - 2])
                {
                    for(j = [0:floor(mesh_depth / cellsize / 1.733) - 1])
                    {
                        translate([i * cellsize, j * cellsize * 1.733, 0])
                        {
                            rotate([0, 0, 90])
                            cylinder(d = cellsize / 0.866 - cellthickness , h = table_thickness * 2, $fn = 6);
                        }
                    }
                }
            }
        }
    }
}
module table_guide()
{
    difference()
    {
        union()
        {
            cylinder(d = frame_width, h = guide_thickness);
            translate([-frame_width / 2, 0 , 0])
            {
                cube([frame_width, frame_width * 1.5 , guide_thickness]);
            }
            /*rotate([0, 0, 45])*/
            {
                translate([-frame_width, 0 , 0])
                {
                    cube([frame_width,  frame_width * 1.5 , guide_thickness]);
                }
            }
            translate([0, 0 , -guide_thickness * 2])
            {
                cylinder(d = frame_width * 0.75, h = guide_thickness * 2);
            }
        }
        translate([0, 0 , -guide_thickness * 3])
        {
            cylinder(d = pillar_thickness, h = guide_thickness * 10);
        }
        translate([0, frame_width , -guide_thickness / 2])
        {
            cylinder(d = pillar_thickness, h = guide_thickness * 2);
        }
    }
}



// guiderods
translate([frame_width / 2,  frame_width / 2, 0])
{
    % cylinder(d = pillar_thickness, h = height);
}
translate([frame_width / 2,  depth - frame_width / 2, 0])
{
    % cylinder(d = pillar_thickness, h = height);
}
translate([width - frame_width / 2,  frame_width / 2, 0])
{
    % cylinder(d = pillar_thickness, h = height);
}
translate([width - frame_width / 2,  depth - frame_width / 2, 0])
{
    % cylinder(d = pillar_thickness, h = height);
}
// screws
translate([frame_width / 2 + frame_width,  frame_width / 2, 0])
{
    % cylinder(d = pillar_thickness, h = height);
}
translate([frame_width / 2 + frame_width,  depth - frame_width / 2, 0])
{
    % cylinder(d = pillar_thickness, h = height);
}
translate([width - frame_width / 2 - frame_width,  frame_width / 2, 0])
{
    % cylinder(d = pillar_thickness, h = height);
}
translate([width - frame_width / 2 - frame_width,  depth - frame_width / 2, 0])
{
    % cylinder(d = pillar_thickness, h = height);
}
% frame();
translate([0, 0, height - frame_thickness])
{
    % frame();
}
table_height = $t * (height - frame_thickness * 2 - guide_thickness * 3) + frame_thickness + guide_thickness * 3;
translate([frame_width, frame_width, table_height])
{
    table();
}
translate([frame_width / 2, frame_width / 2, table_height - guide_thickness ])
{
    rotate([0, 0, -90])
    {
        table_guide();
    }
}
translate([width - frame_width / 2, frame_width / 2, table_height - guide_thickness ])
{
    rotate([0, 0, -90])
    {
        mirror([0, 1, 0])
        {
            table_guide();
        }
    }
}
translate([frame_width / 2, depth - frame_width / 2, table_height - guide_thickness ])
{
    rotate([0, 0, 90])
    {
        mirror([0, 1, 0])
        {
            table_guide();
        }
    }
}
translate([width - frame_width / 2, depth - frame_width / 2, table_height - guide_thickness ])
{
    rotate([0, 0, 90])
    {
        table_guide();
    }
}
