exithole_radius = 1;
outer_radius = 15;
total_height = 40;
lens_radius = 8;
lensoffset = 5;
difference()
{
    rotate_extrude($fn = 128)
    {
        polygon(points = [
                             [exithole_radius, 2],
                             [exithole_radius, 0],
                             [exithole_radius + 3, 0],
                             [exithole_radius + 6, 4],
                             [outer_radius, total_height - 20],
                             [outer_radius, total_height],
                             [21.5 / 2, total_height],
                             [20.5 / 2, total_height - 0.5],
                             [20.5 / 2, total_height - lensoffset ],
                             [lens_radius + 0.4, total_height - lensoffset],
                             [lens_radius + 0.2, total_height - lensoffset - 0.2],
                             [lens_radius + 0.2, total_height  - lensoffset - 1],
                             [lens_radius - 0.8, total_height - lensoffset - 1],
                             [lens_radius - 1, total_height - lensoffset - 1.2],
                             [lens_radius - 1, 15],
                             [lens_radius / 2, 15],
                             [lens_radius / 2, 6],
                             [lens_radius / 3, 6],
                             [lens_radius / 3, 2],
                         ]);
    }
    // cut it in half to see whats going on
    translate([0, -20, -1])
    {
        cube([40, 40, 45]);
    }
}
