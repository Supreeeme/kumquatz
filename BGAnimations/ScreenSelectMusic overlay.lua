local t = Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self)
			self:xy(_screen.cx,0):setsize(_screen.w,100):diffuse(color("#0088CC")):zoomx(0):bounceend(0.3):zoomx(1)
		end,
		OffCommand=function(self) self:bounceend(0.15):zoomx(0) end
	},
	Font("_star","avenue")..{
		Text=ScreenString("Header"),
		OnCommand=cmd(xy,_screen.cx,30;zoomx,0;bounceend,0.3;zoomx,1),
		OffCommand=function(self) self:bounceend(0.15):zoomx(0) end,
	}
}

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(xy,190,SCREEN_CENTER_Y-20;visible,not GAMESTATE:IsCourseMode());
	Def.StepsDisplayList {
		OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				self:stoptweening():bounceend(0.15):zoomx(1)
			else
				self:stoptweening():bouncebegin(0.15):zoomx(0):sleep(0.2)
			end
		end;
		Name="StepsDisplayListRow";
		CursorP1= Def.ActorFrame{
			InitCommand=cmd(x,-100;player,PLAYER_1);
			Def.BitmapText{
				Font="_geosanslight",
				Text="P1",
				OnCommand=cmd(zoom,0.6;y,-2;x,-1;diffuse,PlayerColor(PLAYER_1);shadowlength,1)
			};

		};
		CursorP2= Def.ActorFrame{
			InitCommand=cmd(x,-125;diffuse,PlayerColor(PLAYER_2);player,PLAYER_2);
			PlayerJoinedMessageCommand=function(self, params)
					if params.Player == PLAYER_2 then
						self:visible(true);
						(cmd(zoom,0;bounceend,1;zoom,1))(self);
					end;
			end;
			Def.BitmapText{
				Font="_geosanslight",
				Text="P2",
				OnCommand=cmd(zoom,0.6;y,-2;x,-1;diffuse,PlayerColor(PLAYER_2);shadowlength,1)
			};
		};
		CursorP1Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening;decelerate,0.1);
		};
		CursorP2Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening;decelerate,0.05);
		};
	};
};

return t