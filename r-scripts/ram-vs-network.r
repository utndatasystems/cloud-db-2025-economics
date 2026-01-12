to_svg <- svgstring(width = output.width.inch, height = output.height.inch, scaling = 1)

df$year <- as.numeric(df$year)
df$avg_gib_per_gbitps <- as.numeric(df$avg_gib_per_gbitps)
df$category <- as.factor(df$category)

output <- ggplot(df, aes(x = year, y = avg_gib_per_gbitps, colour = category, group = category)) +
  labs(x = 'Instance release year', y = 'Avg GiB per Gbit/s (ram/net)') +
  geom_line() +
  geom_point() +
  ggtitle('Memory-to-Network Balance (current instances, by release year)') +
  expand_limits(y = 0) +
  theme_bw()

plot(output); dev.off(); to_svg()