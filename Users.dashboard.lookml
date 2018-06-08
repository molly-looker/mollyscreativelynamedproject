- dashboard: user_data
  title: User Data
  layout: newspaper
  elements:
  - name: Users in the US
    title: Users in the US
    model: molly_s_creatively_named_project
    explore: users
    type: looker_map
    fields:
    - allusers.id
    - allusers.zip
    filters:
      users.state: ''
    sorts:
    - allusers.id
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    map_latitude: 37.37015718405753
    map_longitude: -94.04296875000001
    map_zoom: 3
    row: 0
    col: 0
    width: 8
    height: 6
  - title: "# of Users by State"
    name: "# of Users by State"
    model: molly_s_creatively_named_project
    explore: users
    type: looker_map
    fields:
    - allusers.state
    - allusers.count
    filters:
      users.state: ''
    sorts:
    - allusers.state desc
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.6
    show_region_field: true
    draw_map_labels_above_data: false
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: imperial
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    map_latitude: 48.3416461723746
    map_longitude: -111.4453125
    map_zoom: 2
    row: 0
    col: 8
    width: 8
    height: 6
