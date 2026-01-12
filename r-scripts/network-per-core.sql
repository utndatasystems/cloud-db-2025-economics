to_svg <- svgstring(width = output.width.inch, height = output.height.inch, scaling = 1)
theme_set(theme_bw())

df$year <- as.numeric(df$year)
df$avg_gbitps_per_core <- as.numeric(df$avg_gbitps_per_core)
df$category <- as.factor(df$category)

output <- ggplot(df, aes(x = year, y = avg_gbitps_per_core, colour = category, group = category)) +
  labs(x = 'Launch Year', y = 'Avg baseline network per core (Gbit/s/core)') +
  geom_line() +
  geom_point() +
  ggtitle('Baseline Network per Core over Time (current instances)') +
  expand_limits(y = 0) +
  theme_bw()

plot(output); dev.off(); to_svg()