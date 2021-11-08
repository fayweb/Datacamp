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

#Use the count verb to count each part_cat_id in the parts table.
#Use a right_join to join part_categories. You'll need to use the part_cat_id from the count and the id column from part_categories.
parts %>%
    # Count the part_cat_id
    count(part_cat_id) %>%
    # Right join part_categories
    right_join(part_categories, by = c("part_cat_id" = "id"))

#filter for where the column n is na
parts %>%
    count(part_cat_id) %>%
    right_join(part_categories, by = c("part_cat_id" = "id")) %>%
    # Filter for NA
    filter(is.na(n))


#Cleaning up your count
#In both left and right joins, there is the opportunity for there to be NA values in the resulting table. Fortunately, the replace_na function can turn those NAs into meaningful values.
#In the last exercise, we saw that the n column had NAs after the right_join. Let's use the replace_na column, which takes a list of column names and the values with which NAs should be replaced, to clean up our table.
#Use replace_na to replace NAs in the n column with the value 0.
parts %>%
    count(part_cat_id) %>%
    right_join(part_categories, by = c("part_cat_id" = "id")) %>%
    # Use replace_na to replace missing values in the n column
    replace_na(list(n = 0))

#Tables can be joined to themselves!
#In the themes table, which is available for you to inspect in the console, you'll notice there is both an id column and a parent_id column. Keeping that in mind, you can join the themes table to itself to determine the parent-child relationships that exist for different themes.
#In the videos, you saw themes joined to their own parents. In this exercise, you'll try a similar approach of joining themes to their own children, which is similar but reversed. Let's try this out to discover what children the theme "Harry Potter" has.
#Inner join themes to their own children, resulting in the suffixes "_parent" and "_child", respectively.
#Filter this table to find the children of the "Harry Potter" theme.
themes %>% 
    # Inner join the themes table
    inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
    filter(name_parent == "Harry Potter")

#Left join the themes table to its own children, with the suffixes _parent and _child respectively.
#Filter the result of the join to find themes that have no children.
themes %>% 
    # Left join the themes table to its own children
    left_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
    # Filter for themes that have no child themes
    filter(is.na(name_child))

## Count the part number and color id, weight by quantity
batman %>%
    count(part_num, color_id, wt = quantity)
star_wars %>%
    count(part_num, color_id, wt = quantity)

#Combine the star_wars_parts table with the batman_parts table; use the suffix argument to include the "_batman" and "_star_wars" suffixes.
#Replace all the NA values in the n_batman and n_star_wars columns with 0s.
batman_parts %>%
    # Combine the star_wars_parts table 
    full_join(star_wars_parts, by= c("part_num", "color_id"), suffix = c("_batman", "_star_wars"))  %>%
    # Replace NAs with 0s in the n_batman and n_star_wars columns 
    replace_na(list(n_batman = 0, n_star_wars = 0))

#Sort the number of star wars pieces in the parts_joined table in descending order.
#Inner join the colors table to the parts_joined table.
#Combine the parts table to the previous join using an inner join; add "_color" and "_part" suffixes to specify whether or not the information came from the colors table or the parts table.
parts_joined %>%
    # Sort the number of star wars pieces in descending order 
    arrange(desc(n_star_wars)) %>%
    # Join the colors table to the parts_joined table
    inner_join(colors, by = c("color_id" = "id")) %>%
    # Join the parts table to the previous join 
    inner_join(parts, by = "part_num", suffix = c("_color", "_part"))


#lfiltering joins
#they keeps or removes observations in the first table, but does not add variables
#full join: keeps all observations from both tables
# semi join: filter the first table for observations that match the second
#anti join asks what observations of the first table are not in the second table 

#Filter the batwing set for parts that are also in the batmobile, whether or not they have the same color.
#Filter the batwing set for parts that aren't also in the batmobile, whether or not they have the same color.
# Filter the batwing set for parts that are also in the batmobile set
batwing %>%
    semi_join(batmobile, by = "part_num")


# Filter the batwing set for parts that aren't in the batmobile set
batwing %>%
    anti_join(batmobile, by = "part_num")

#Use the inventory_parts table to find the colors that are included in at least one set.
# Use inventory_parts to find colors included in at least one set
colors %>%
    semi_join(inventory_parts, by = c("id" = "color_id"))

#Use filter() to extract version 1 from the inventories table; save the filter to version_1_inventories.
#Use anti_join to combine version_1_inventories with sets to determine which set is missing a version 

# Use filter() to extract version 1 
version_1_inventories <- inventories %>%
    filter(version == 1)

# Use anti_join() to find which set is missing a version 1
sets %>%
    anti_join(version_1_inventories, by = "set_num")

#Add a filter for the "Batman" set to create the batman_colors object.
#Add a fraction column to batman_colors that displays the total divided by the sum of the total.
#Repeat the steps to filter and aggregate the "Star Wars" set data to create the star_wars_colors object.
#Add a fraction column to star_wars_colors to display the fraction of the total.
batman_colors <- inventory_parts_themes %>%
    # Filter the inventory_parts_themes table for the Batman theme
    filter(name_theme == "Batman") %>%
    group_by(color_id) %>%
    summarize(total = sum(quantity)) %>%
    # Add a fraction column of the total divided by the sum of the total 
    mutate(fraction = total / sum(total))

# Filter and aggregate the Star Wars set data; add a fraction column
star_wars_colors <- inventory_parts_themes %>%
    filter(name_theme == "Star Wars") %>%
    group_by(color_id) %>%
    summarize(total = sum(quantity)) %>%
    mutate(fraction = total / sum(total))

#Join the batman_colors and star_wars_colors tables; be sure to include all observations from both tables.
#Replace the NAs in the total_batman and total_star_wars columns.
#Add a difference column which is the difference between fraction_batman and fraction_star_wars, and a total column, which is the sum of total_batman and total_star_wars.
#Add a filter to select observations where total is at least 200.
batman_colors %>%
    full_join(star_wars_colors, by = "color_id", suffix = c("_batman", "_star_wars")) %>%
    replace_na(list(total_batman = 0, total_star_wars = 0)) %>%
    inner_join(colors, by = c("color_id" = "id")) %>%
    # Create the difference and total columns
    mutate(difference = fraction_batman - fraction_star_wars,
           total = total_batman + total_star_wars) %>%
    # Filter for totals greater than 200
    filter(total >= 200)


#Create a bar plot using the colors_joined table to display the most prominent colors in the Batman and Star Wars themes, with the bars colored by their name.
# Create a bar plot using colors_joined and the name and difference columns
ggplot(colors_joined, aes(x = name, y = difference, fill = name)) +
    geom_col() +
    coord_flip() +
    scale_fill_manual(values = color_palette, guide = FALSE) +
    labs(y = "Difference: Batman - Star Wars")