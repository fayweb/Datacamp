# Load the ggplot2 package
library(ggplot2)

# Explore the mtcars data frame with str()
str(mtcars)

# Execute the following command
ggplot(mtcars, aes(cyl, mpg)) +
    geom_point()

# Change the color aesthetic to a size aesthetic
ggplot(mtcars, aes(wt, mpg, color = disp)) +
    geom_point()

# Change the color aesthetic to a size aesthetic
ggplot(mtcars, aes(wt, mpg, size = disp)) +
    geom_point()


# Explore the diamonds data frame with str()
str(diamonds)

# Add geom_smooth() with +
ggplot(diamonds, aes(carat, price)) +
    geom_point() +
    geom_smooth()


# Map the color aesthetic to clarity
ggplot(diamonds, aes(carat, price, color = clarity)) +
    geom_point() +
    geom_smooth()

# Make the points 40% opaque
ggplot(diamonds, aes(carat, price, color = clarity)) +
    geom_point(alpha = 0.4) +
    geom_smooth()

#how to save plots as variables
# Draw a ggplot
plt_price_vs_carat <- ggplot(
    # Use the diamonds dataset
    diamonds,
    # For the aesthetics, map x to carat and y to price
    aes(carat, price)
) 

# Add a point layer to plt_price_vs_carat
plt_price_vs_carat + geom_point()

# From previous step
plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))

# Edit this to make points 20% opaque: plt_price_vs_carat_transparent
plt_price_vs_carat_transparent <- plt_price_vs_carat + geom_point(alpha = 0.2)

# See the plot
plt_price_vs_carat_transparent

# From previous step
plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))

# Edit this to map color to clarity,
# Assign the updated plot to a new object
plt_price_vs_carat_by_clarity <- plt_price_vs_carat + geom_point(aes(color = clarity))

# See the plot
plt_price_vs_carat_by_clarity

# Map x to mpg and y to fcyl
ggplot(mtcars, aes(mpg, fcyl)) +
    geom_point()

# Swap mpg and fcyl
ggplot(mtcars, aes(fcyl, mpg)) +
    geom_point()

# Map x to wt, y to mpg and color to fcyl
ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
    geom_point()

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
    # Set the shape and size of the points
    geom_point(shape = 1, size = 4)

#All shape values are described on the points() help page.
# Map fcyl to fill
ggplot(mtcars, aes(wt, mpg, fill = fcyl)) +
    geom_point(shape = 1, size = 4)

ggplot(mtcars, aes(wt, mpg, fill = fcyl)) +
    # Change point shape; set alpha
    geom_point(shape = 21, size = 4, alpha = 0.6)

# Map color to fam
ggplot(mtcars, aes(wt, mpg, fill = fcyl, color = fam)) +
    geom_point(shape = 21, size = 4, alpha = 0.6)

# Establish the base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(wt, mpg)) 
str(mtcars)

# Map fcyl to size
plt_mpg_vs_wt +
    geom_point(aes(size = fcyl))

# Map fcyl to alpha, not size
plt_mpg_vs_wt +
    geom_point(aes(alpha = fcyl))

# Map fcyl to shape, not alpha
plt_mpg_vs_wt +
    geom_point(aes(shape = fcyl))

# Base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(wt, mpg))

# Use text layer and map fcyl to label
plt_mpg_vs_wt +
    geom_text(aes(label = fcyl))

#Great! label and shape are only applicable to categorical data.
# A hexadecimal color
my_blue <- "#4ABEFF"

ggplot(mtcars, aes(wt, mpg)) +
    # Set the point color and alpha
    geom_point(color = my_blue, alpha = 0.6)

# A hexadecimal color
my_blue <- "#4ABEFF"

# Change the color mapping to a fill mapping
ggplot(mtcars, aes(wt, mpg, fill = fcyl)) +
    # Set point size and shape
    geom_point(color = my_blue, size = 10, shape = 1)

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
    # Add point layer with alpha 0.5
    geom_point(alpha = 0.5)


ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
    # Add text layer with label rownames(mtcars) and color red
    geom_text(label = row.names(mtcars), color = "red")

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
    # Add points layer with shape 24 and color yellow
    geom_point(shape = 24, color = "yellow")

# 3 aesthetics: qsec vs. mpg, colored by fcyl
ggplot(mtcars, aes(mpg, qsec, color = fcyl)) +
    geom_point()

# 4 aesthetics: add a mapping of shape to fam
ggplot(mtcars, aes(mpg, qsec, color = fcyl, shape = fam)) +
    geom_point()

# 4 aesthetics: add a mapping of shape to fam
ggplot(mtcars, aes(mpg, qsec, color = fcyl, shape = fam)) +
    geom_point()

ggplot(mtcars, aes(fcyl, fill = fam)) +
    geom_bar() +
    # Set the axis labels
    labs(x = "Number of Cylinders", y = "Count")

#scale_color_manual() defines properties of the color scale (i.e. axis). The first argument sets the legend title. values is a named vector of colors to use.
palette <- c(automatic = "#377EB8", manual = "#E41A1C")

ggplot(mtcars, aes(fcyl, fill = fam)) +
    geom_bar() +
    labs(x = "Number of Cylinders", y = "Count") +
    # Set the fill color scale
    scale_fill_manual("Transmission", values = palette)

palette <- c(automatic = "#377EB8", manual = "#E41A1C")

# Set the position
ggplot(mtcars, aes(fcyl, fill = fam)) +
    geom_bar(position = "dodge") +
    labs(x = "Number of Cylinders", y = "Count")
scale_fill_manual("Transmission", values = palette)

# Plot 0 vs. mpg
ggplot(mtcars, aes(mpg, y =0)) +
    # Add jitter 
    geom_point(position = "jitter")

ggplot(mtcars, aes(mpg, 0)) +
    geom_jitter() +
    # Set the y-axis limits
    ylim(-2, 2)

#Typically, the dependent variable is mapped onto the the y-axis and the independent variable is mapped onto the x-axis.
# Plot price vs. carat, colored by clarity
plt_price_vs_carat_by_clarity <- ggplot(diamonds, aes(carat, price, color = clarity))

# Add a point layer with tiny points
plt_price_vs_carat_by_clarity + geom_point(alpha = 0.5, shape = ".")

# Plot base
plt_mpg_vs_fcyl_by_fam <- ggplot(mtcars, aes(fcyl, mpg, color = fam))

# Default points are shown for comparison
plt_mpg_vs_fcyl_by_fam + geom_point()

# Alter the point positions by jittering, width 0.3
plt_mpg_vs_fcyl_by_fam + geom_point(position = position_jitter(width = 0.3))

# Plot base
plt_mpg_vs_fcyl_by_fam <- ggplot(mtcars, aes(fcyl, mpg, color = fam))

# Default points are shown for comparison
plt_mpg_vs_fcyl_by_fam + geom_point()

# Now jitter and dodge the point positions
plt_mpg_vs_fcyl_by_fam + geom_point(position = position_jitterdodge(jitter.width = 0.3, dodge.width = 0.3))

#Overplotting 3: Low-precision data
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
    # Swap for jitter layer with width 0.1
    geom_jitter(alpha = 0.5, width = 0.1)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
    # Set the position to jitter
    geom_point(alpha = 0.5, position = "jitter")

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
    # Use a jitter position function with width 0.1
    geom_point(alpha = 0.5, position = position_jitter(width = 0.1))

#Overplotting 4: Integer data
# Examine the structure of Vocab
str(Vocab)

# Plot vocabulary vs. education
ggplot(Vocab, aes(education, vocabulary)) +
    # Add a point layer
    geom_point()

ggplot(Vocab, aes(education, vocabulary)) +
    # Change to a jitter layer
    geom_jitter()

ggplot(Vocab, aes(education, vocabulary)) +
    # Set the transparency to 0.2
    geom_jitter(alpha = 0.2)

ggplot(Vocab, aes(education, vocabulary)) +
    # Set the shape to 1
    geom_jitter(alpha = 0.2, shape = 1)

# Plot mpg
ggplot(mtcars, aes(mpg)) +
    # Add a histogram layer
    geom_histogram()

ggplot(mtcars, aes(mpg)) +
    # Set the binwidth to 1
    geom_histogram(binwidth = 1)

# Map y to ..density..
ggplot(mtcars, aes(mpg, ..density..)) +
    geom_histogram(binwidth = 1)

datacamp_light_blue <- "#51A8C9"

ggplot(mtcars, aes(mpg, ..density..)) +
    # Set the fill color to datacamp_light_blue
    geom_histogram(binwidth = 1, fill = datacamp_light_blue)

#Good job! Histograms are one of the most common exploratory plots for continuous data. If you want to use density on the y-axis be sure to set your binwidth to an intuitive value.
# Update the aesthetics so the fill color is by fam
ggplot(mtcars, aes(mpg, fill = fam)) +
    geom_histogram(binwidth = 1)

ggplot(mtcars, aes(mpg, fill = fam)) +
    # Change the position to dodge
    geom_histogram(binwidth = 1, position = "dodge")

ggplot(mtcars, aes(mpg, fill = fam)) +
    # Change the position to fill
    geom_histogram(binwidth = 1, position = "fill")

ggplot(mtcars, aes(mpg, fill = fam)) +
    # Change the position to identity, with transparency 0.4
    geom_histogram(binwidth = 1, position = "identity", alpha = 0.4)

# Plot fcyl, filled by fam
ggplot(mtcars, aes(fcyl, fill = fam)) +
    # Add a bar layer
    geom_bar()

ggplot(mtcars, aes(fcyl, fill = fam)) +
    # Set the position to "fill"
    geom_bar(position = "fill")

ggplot(mtcars, aes(fcyl, fill = fam)) +
    # Change the position to "dodge"
    geom_bar(position = "dodge")

ggplot(mtcars, aes(cyl, fill = fam)) +
    # Change position to use the functional form, with width 0.2
    geom_bar(position = position_dodge(width = 0.2))

ggplot(mtcars, aes(cyl, fill = fam)) +
    # Set the transparency to 0.6
    geom_bar(position = position_dodge(width = 0.2), alpha = 0.6)

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = vocabulary))

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = vocabulary)) +
    # Add a bar layer with position "fill"
    geom_bar(position = "fill")

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = vocabulary)) +
    # Add a bar layer with position "fill"
    geom_bar(position = "fill") +
    # Add a brewer fill scale with default palette
    scale_fill_brewer()

# Print the head of economics
head(economics)

# Using economics, plot unemploy vs. date
ggplot(economics, aes(date, unemploy)) +
    # Make it a line plot
    geom_line()

# Change the y-axis to the proportion of the population that is unemployed
ggplot(economics, aes(date, unemploy / pop)) +
    geom_line()

# Plot the Rainbow Salmon time series
ggplot(fish.species, aes(x = Year, y = Rainbow)) +
    geom_line()


# Plot the Pink Salmon time series
ggplot(fish.species, aes(Year, Pink)) +
    geom_line()


# Plot multiple time-series by grouping by species
ggplot(fish.tidy, aes(Year, Capture)) +
    geom_line(aes(group = Species))

# Plot multiple time-series by coloring by species
ggplot(fish.tidy, aes(x = Year, y = Capture, color = Species)) +
    geom_line()

# View the default plot
plt_prop_unemployed_over_time

# Remove legend entirely
plt_prop_unemployed_over_time +
    theme(legend.position = "none")

# Position the legend at the bottom of the plot
plt_prop_unemployed_over_time +
    theme(legend.position = "bottom")

# Position the legend inside the plot at (0.6, 0.1)
plt_prop_unemployed_over_time +
    theme(legend.position = c(0.6, 0.1))

plt_prop_unemployed_over_time +
    theme(
        # For all rectangles, set the fill color to grey92
        rect = element_rect(fill = "grey92"),
        # For the legend key, turn off the outline
        legend.key = element_rect(color = NA)
    )

plt_prop_unemployed_over_time +
    theme(
        rect = element_rect(fill = "grey92"),
        legend.key = element_rect(color = NA),
        # Turn off axis ticks
        axis.ticks = element_blank(),
        # Turn off the panel grid
        panel.grid = element_blank()
    )

plt_prop_unemployed_over_time +
    theme(
        rect = element_rect(fill = "grey92"),
        legend.key = element_rect(color = NA),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        # Add major y-axis panel grid lines back
        panel.grid.major.y = element_line(
            # Set the color to white
            color = "white",
            # Set the size to 0.5
            size = 0.5,
            # Set the line type to dotted
            linetype = "dotted"
        )
    )

plt_prop_unemployed_over_time +
    theme(
        rect = element_rect(fill = "grey92"),
        legend.key = element_rect(color = NA),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.grid.major.y = element_line(
            color = "white",
            size = 0.5,
            linetype = "dotted"
        ),
        # Set the axis text color to grey25
        axis.text = element_text(color = "grey25"),
        # Set the plot title font face to italic and font size to 16
        plot.title = element_text(size = 16, face = "italic")
    )

# View the original plot
plt_mpg_vs_wt_by_cyl

plt_mpg_vs_wt_by_cyl +
    theme(
        # Set the axis tick length to 2 lines
        axis.ticks.length = unit(2, "lines")
    )

plt_mpg_vs_wt_by_cyl +
    theme(
        # Set the legend key size to 3 centimeters
        legend.key.size = unit(3, "cm")
    )

plt_mpg_vs_wt_by_cyl +
    theme(
        # Set the legend margin to (20, 30, 40, 50) points
        legend.margin = margin(20, 30, 40, 50, "pt")
    )

plt_mpg_vs_wt_by_cyl +
    theme(
        # Set the plot margin to (10, 30, 50, 70) millimeters
        plot.margin = margin(10, 30, 50, 70, "mm")
    )

#built-in themes
# Add a black and white theme
plt_prop_unemployed_over_time +
    theme_bw()

# Add a void theme
plt_prop_unemployed_over_time +
    theme_classic()

# Add a void theme
plt_prop_unemployed_over_time +
    theme_void()

# Use the fivethirtyeight theme
plt_prop_unemployed_over_time +
    theme_fivethirtyeight()

# Use Tufte's theme
plt_prop_unemployed_over_time +
    theme_tufte()

# Use the Wall Street Journal theme
plt_prop_unemployed_over_time +
    theme_wsj()

# Theme layer saved as an object, theme_recession
theme_recession <- theme(
    rect = element_rect(fill = "grey92"),
    legend.key = element_rect(color = NA),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "white", size = 0.5, linetype = "dotted"),
    axis.text = element_text(color = "grey25"),
    plot.title = element_text(face = "italic", size = 16),
    legend.position = c(0.6, 0.1)
)

# Combine the Tufte theme with theme_recession
theme_tufte_recession <- theme_tufte() + theme_recession

# Add the recession theme to the plot
plt_prop_unemployed_over_time + theme_tufte_recession

theme_recession <- theme(
    rect = element_rect(fill = "grey92"),
    legend.key = element_rect(color = NA),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "white", size = 0.5, linetype = "dotted"),
    axis.text = element_text(color = "grey25"),
    plot.title = element_text(face = "italic", size = 16),
    legend.position = c(0.6, 0.1)
)
theme_tufte_recession <- theme_tufte() + theme_recession

# Set theme_tufte_recession as the default theme
theme_set(theme_tufte_recession)

# Draw the plot (without explicitly adding a theme)
plt_prop_unemployed_over_time

plt_prop_unemployed_over_time +
    # Add Tufte's theme
    theme_tufte()

plt_prop_unemployed_over_time +
    theme_tufte() +
    theme(
        legend.position = "none",
        axis.ticks = element_blank(),
        # Set the axis title's text color to grey60
        axis.title = element_text(color = "grey60"),
        # Set the axis text's text color to grey60
        axis.text = element_text(color = "grey60")
    )

plt_prop_unemployed_over_time +
    theme_tufte() +
    theme(
        legend.position = "none",
        axis.ticks = element_blank(),
        axis.title = element_text(color = "grey60"),
        axis.text = element_text(color = "grey60"),
        # Set the panel gridlines major y values
        panel.grid.major.y = element_line(
            # Set the color to grey60
            color = "grey60",
            # Set the size to 0.25
            size = 0.25,
            # Set the linetype to dotted
            linetype = "dotted"
        )
    )

# Add a geom_segment() layer
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
    geom_point(size = 4) +
    geom_segment(aes(xend = 30, yend = country), size = 2)

# Add a geom_text() layer
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
    geom_point(size = 4) +
    geom_segment(aes(xend = 30, yend = country), size = 2) +
    geom_text(aes(label = lifeExp), color = "white", size = 1.5)

# Set the color scale
palette <- brewer.pal(5, "RdYlBu")[-(2:4)]

# Add a title and caption
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
    geom_point(size = 4) +
    geom_segment(aes(xend = 30, yend = country), size = 2) +
    geom_text(aes(label = round(lifeExp,1)), color = "white", size = 1.5) +
    scale_x_continuous("", expand = c(0,0), limits = c(30,90), position = "top") +
    scale_color_gradientn(colors = palette) +
    labs(title = "Highest and lowest life expectancies, 2007", caption = "Source: gapminder")

# Define the theme
plt_country_vs_lifeExp +
    theme_classic() +
    theme(axis.line.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.text = element_text(color = "black"),
          axis.title = element_blank(),
          legend.position = "none")

# Add text
plt_country_vs_lifeExp +
    step_1_themes +
    geom_vline(xintercept = global_mean, color = "grey40", linetype = 3) +
    annotate(
        "text",
        x = x_start, y = y_start,
        label = "The\nglobal\naverage",
        vjust = 1, size = 3, color = "grey40"
    )

# Add a curve
plt_country_vs_lifeExp +
    step_1_themes +
    geom_vline(xintercept = global_mean, color = "grey40", linetype = 3) +
    step_3_annotation +
    annotate(
        "curve",
        x = x_start, y = y_start,
        xend = x_end, yend = y_end,
        arrow = arrow(length = unit(0.2, "cm"), type = "closed"),
        color = "grey40"
    )


# View the structure of mtcars
str(mtcars)

# Using mtcars, draw a scatter plot of mpg vs. wt
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point()

# Amend the plot to add a smooth layer
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    geom_smooth()

# Amend the plot. Swap geom_smooth() for stat_smooth().
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE)

# Amend the plot. Swap geom_smooth() for stat_smooth().
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    stat_smooth(method = "lm", se = FALSE)

# Amend the plot to add another smooth layer with dummy grouping
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl)) +
    geom_point() +
    stat_smooth(method = "lm", se = FALSE)

# Amend the plot to add another smooth layer with dummy grouping
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl)) +
    geom_point() +
    stat_smooth(method = "lm", se = FALSE) +
    stat_smooth(method = "lm", se = FALSE, aes(group =1))

ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    # Add 3 smooth LOESS stats, varying span & color
    stat_smooth(se = FALSE, color = "red", span = 0.9) +
    stat_smooth(se = FALSE, color = "green", span = 0.6) +
    stat_smooth(se = FALSE, color = "blue", span = 0.3)

# Amend the plot to color by fcyl
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    # Add a smooth LOESS stat, no ribbon
    stat_smooth(se = FALSE) +
    # Add a smooth lin. reg. stat, no ribbon
    stat_smooth(method ="lm", se = FALSE)

# Amend the plot
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl)) +
    geom_point() +
    # Map color to dummy variable "All"
    stat_smooth(aes(color = "All"), se = FALSE) +
    stat_smooth(method = "lm", se = FALSE)

# Using Vocab, plot vocabulary vs. education, colored by year group
ggplot(Vocab, aes(education, vocabulary, color = year_group)) +
    # Add jittered points with transparency 0.25
    geom_jitter(alpha = 0.25) +
    # Add a smooth lin. reg. line (with ribbon)
    stat_smooth(method = "lm", se = TRUE)

# Amend the plot
ggplot(Vocab, aes(x = education, y = vocabulary, color = year_group)) +
    geom_jitter(alpha = 0.25) +
    # Map the fill color to year_group, set the line size to 2
    stat_smooth(method = "lm", aes(fill = year_group, size = 2))

ggplot(Vocab, aes(x = education, y = vocabulary)) +
    geom_jitter(alpha = 0.25) +
    # Add a quantile stat, at 0.05, 0.5, and 0.95
    stat_quantile(quantiles = c(0.05, 0.5, 0.95))

# Amend the plot to color by year_group
ggplot(Vocab, aes(x = education, y = vocabulary, color = year_group)) +
    geom_jitter(alpha = 0.25) +
    stat_quantile(quantiles = c(0.05, 0.5, 0.95))

# Run this, look at the plot, then update it
ggplot(Vocab, aes(x = education, y = vocabulary)) +
    # Replace this with a sum stat
    geom_jitter(alpha = 0.25)

# Run this, look at the plot, then update it
ggplot(Vocab, aes(x = education, y = vocabulary)) +
    # Replace this with a sum stat
    stat_sum(alpha = 0.25)

ggplot(Vocab, aes(x = education, y = vocabulary)) +
    stat_sum() +
    # Add a size scale, from 1 to 10
    scale_size(range = c(1, 10))

# Amend the stat to use proportion sizes
ggplot(Vocab, aes(x = education, y = vocabulary)) +
    stat_sum(aes(size = ..prop..))

# Amend the plot to group by education
ggplot(Vocab, aes(x = education, y = vocabulary, group = education)) +
    stat_sum(aes(size = ..prop..))

# Define position objects
# 1. Jitter with width 0.2
posn_j <- position_jitter(width = 0.2)

# 2. Dodge with width 0.1
posn_d <- position_dodge(width = 0.1)

# 3. Jitter-dodge with jitter.width 0.2 and dodge.width 0.1
posn_jd <- position_jitterdodge(jitter.width = 0.2, dodge.width = 0.1)

# From previous step
posn_j <- position_jitter(width = 0.2)
posn_d <- position_dodge(width = 0.1)
posn_jd <- position_jitterdodge(jitter.width = 0.2, dodge.width = 0.1)

# Create the plot base: wt vs. fcyl, colored by fam
p_wt_vs_fcyl_by_fam <- ggplot(mtcars, aes(x = fcyl, y = wt, color = fam)) 

# Add a point layer
p_wt_vs_fcyl_by_fam +
    geom_point()

# Add jittering only
p_wt_vs_fcyl_by_fam +
    geom_point(position = posn_j)

# Add dodging only
p_wt_vs_fcyl_by_fam +
    geom_point(position = posn_d)

# Add jittering and dodging
p_wt_vs_fcyl_by_fam +
    geom_point(position = posn_jd)

p_wt_vs_fcyl_by_fam_jit +
    # Change the geom to be an errorbar
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), position = posn_d)

p_wt_vs_fcyl_by_fam_jit +
    # Change the geom to be an errorbar
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), position = posn_d, geom = ("errorbar"))
