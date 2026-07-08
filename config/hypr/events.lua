--- events customisation

hl.on("workspace.active", function(ws)
  hl.notification.create({ 
		  text = "Observing World: " .. ws.name, timeout = 800, icon = "ok"
  })
end)

hl.on("window.move_to_workspace", function(w, ws)
  hl.notification.create({ 
		  text = "System tab  " .. w.title .. "  moved to the World: " .. ws.name, timeout = 5000, icon = "ok" 
  })
end)

