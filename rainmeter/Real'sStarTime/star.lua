function Initialize()

	read()
	Tnum = Count
	Add = {} for i =1,Tnum do Add[i]=math.random (0,63) end
	Add2 = {} for i =1,Tnum do Add2[i]=0 end
	RangeW=370
	RangeH=40
	RangeS1=2
	RangeS2=25
	Size = {} for i =1,Tnum do Size[i]=math.random (RangeS1,RangeS2) end
	for i = 1,Tnum do
		SKIN:Bang('!SetOption','Star'..i, 'W',Size[i])
	end

end

function Update()
	Twinkle()
end

function read()
	path = SELF:GetOption("filepath")
	file = io.open(path, "r")
	get = file:read("*a")
	Count=0
	for w in string.gmatch(get, "%[Star%d+%]") do
		Count = Count + 1
	end
	file:close()
end

function Twinkle()
	for i = 1,Tnum do
		Add[i]=Add[i]+1
		Add2[i]=math.sin(math.fmod(Add[i],math.floor(math.pi*20))/20)*250
		SKIN:Bang('!SetOption','Star'..i, 'ImageAlpha',Add2[i])
	
		if Add2[i] == 0 then
			local rx=math.random (1,RangeW)
			local ry=math.random (1,RangeH)+70
			local rs=math.random (RangeS1,RangeS2)
			SKIN:Bang('!SetOption','Star'..i, 'X',rx)
			SKIN:Bang('!SetOption','Star'..i, 'Y',ry)
			SKIN:Bang('!SetOption','Star'..i, 'W',rs)
		end
	end
end