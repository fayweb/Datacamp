#inner join = joining two tables 
#the two tables are only joined where matched 
#by argument: where do the two columns match?


#combine two tables by a common column
parts %>%
    inner_join(inventory_parts, by = "part_num")

#using inner join for 3 or more tables
sets %>% #name of first table
    inner_join(inventories, by = "set_num") %>% #name of second table
    inner_join(inventory_parts, by = c("id" = "inventory_id")) #join third table 

#here we join 4 tables 
#for the last one we use suffixes to notify from which table each column is coming
sets %>%
    inner_join(inventories, by = "set_num") %>%
    inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
    inner_join(colors, by = c("color_id" = "id"), suffix = c("_set", "_color"))


#using left join
#joining to the observations of the first table 
millennium_falcon %>%
    left_join(star_destroyer, by = c("part_num", "color_id"), suffix = c("_falcon", "_star_destroyer"))

## Aggregate Millennium Falcon for the total quantity in each part
millennium_falcon_colors <- millennium_falcon %>%
    group_by(color_id) %>%
    summarize(total_quantity = sum(quantity))

# Aggregate Star Destroyer for the total quantity in each part
star_destroyer_colors <- star_destroyer %>%
    group_by(color_id) %>%
    summarize(total_quantity = sum(quantity))

# Left join the Millennium Falcon colors to the Star Destroyer colors
millennium_falcon_colors %>%
    left_join(star_destroyer_colors, by = "color_id", suffix = c("_falcon", "_star_destroyer"))

# Join versions to sets
#then you want to filter to see the na
sets %>%
    left_join(inventory_version_1, by = "set_num") %>%
    # Filter for where version is na
    filter(is.na(version))

#right join is the mirror of left join
parts %>%
    # Count the part_cat_id
    count(part_cat_id) %>%
    # Right join part_categories
    right_join(part_categories, by = c("part_cat_id" = "id"))