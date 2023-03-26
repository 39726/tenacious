local mx9 = {}

mx9.__index = mx9
mx9.__drawn = {}

function mx9:GetDrawn()
    return mx9.__drawn
end

function mx9:InsertToDrawn(object) 
    if object then table.insert(mx9.__drawn, object) end
end

function mx9:DrawSquare(posX, posY, sizeX, sizeY, bgColor) 
    local Square = Drawing.new("Square");
    Square.Visible = true;
    Square.Transparency = 1;
    Square.Color = bgColor;
    Square.Thickness = 1;
    Square.Size = Vector2.new(sizeX, sizeY);
    Square.Position = Vector2.new(posX, posY);
    Square.Filled = true;
    
    mx9:InsertToDrawn(Square);
    
    local Set = {}

    function Set:SetProperties(Properties)
        for _, prop in next, Properties do 
            Square[prop[1]] = prop[2];
        end

        return Set
    end

    return Set
end

function mx9:DrawBorder(posX, posY, sizeX, sizeY, bgColor) 
    local Square = Drawing.new("Square");
    Square.Visible = true;
    Square.Transparency = 1;
    Square.Color = bgColor;
    Square.Thickness = 1;
    Square.Size = Vector2.new(sizeX, sizeY);
    Square.Position = Vector2.new(posX, posY);
    Square.Filled = false;
    
    mx9:InsertToDrawn(Square);
    
    local Set = {}

    function Set:SetProperties(Properties)
        for _, prop in next, Properties do 
            Square[prop[1]] = prop[2];
        end

        return Set
    end

    return Set
end

function mx9:DrawString(text, posX, posY, size, font, bgColor) 
    local String = Drawing.new("Text");
    String.Visible = true;
    String.Transparency = 1;
    String.Color = bgColor;
    String.Text = text;
    String.Size = size;
    String.Position = Vector2.new(posX, posY);
    String.Font = font;
    
    mx9:InsertToDrawn(String);
    
    local Set = {}

    function Set:SetProperties(Properties)
        for _, prop in next, Properties do 
            String[prop[1]] = prop[2];
        end

        return Set
    end

    return Set
end

function mx9:DrawCircle(posX, posY, thickness, numSides, radius, bgColor) 
    local Circle = Drawing.new("Circle");
    Circle.Visible = true;
    Circle.Transparency = 1;
    Circle.Color = bgColor;
    Circle.Thickness = thickness;
    Circle.Position = Vector2.new(posX, posY);
    Circle.NumSides = numSides;
    Circle.Filled = true;
    Circle.Radius = radius;
    
    mx9:InsertToDrawn(Circle);
    
    local Set = {}

    function Set:SetProperties(Properties)
        for _, prop in next, Properties do 
            Circle[prop[1]] = prop[2];
        end

        return Set
    end

    return Set    
end

function mx9:RemoveDrawn() 
    for _, drawn in next, mx9.__drawn do 
        if drawn then drawn:Remove() end
    end
end

return mx9
