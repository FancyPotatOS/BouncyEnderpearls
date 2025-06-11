
# Ensure the master scoreboard exists
scoreboard objectives add bouncyenderpearls.master dummy

# Apply migration if required
execute unless score version bouncyenderpearls.master matches 1.. run function bouncyenderpearls:meta/migrations/latest_version
