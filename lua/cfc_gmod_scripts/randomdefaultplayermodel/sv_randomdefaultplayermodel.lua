hook.Add( "InitPostEntity", "RandomDefaultPlayermodel", function()
  local _, tbl = debug.getupvalue( player_manager.GetPlayerClasses, 2 )
  
  local defTbl = tbl.player_default
  if defTbl then
      function defTbl:SetModel()
          local cl_playermodel = self.Player:GetInfo( "cl_playermodel" )
          local modelname = player_manager.TranslatePlayerModel( cl_playermodel, self.Player )
          util.PrecacheModel( modelname )
          self.Player:SetModel( modelname )
      end
      
      function player_manager.TranslatePlayerModel( name, ply )
          local models = player_manager.AllValidModels()
  
          if models[name] then
              return models[name]
          end
          
          if ply and ply.RandomPlayerModel then
              return ply.RandomPlayerModel
          end
  
          local randomModel = table.Random( models )
          if ply then
              ply.RandomPlayerModel = randomModel
          end
          return randomModel
      end
  end
end )
