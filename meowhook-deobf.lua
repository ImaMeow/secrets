chillvoid1=function()
do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BacekndAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					ApplyDescription(RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Vector3zero = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local RootPartCFrame = RigHumanoidRootPart.CFrame - HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if Humanoid then
				ChangeState(Humanoid, Dead)
				Wait(Humanoid.Died)
			end

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = false
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						UnequipTools(Humanoid)
						taskwait()
						EquipTool(Humanoid, Tool)

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end

		if IsRegistered then
			SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
		else
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		{ MeshId = "117287001096396", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "120169691545791" },
		{ MeshId = "137702817952968", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "135650240593878" },
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "12344206657", Name = "Right Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344206675" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.identity, TextureId = "3360974849" },
		{ MeshId = "12344207333", Name = "Left Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344207341" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.identity, TextureId = "3360978739" },
		{ MeshId = "121304376791439", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "73798034827573" },
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11263219250" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.identity, TextureId = "3650205764" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11159284657" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.identity, TextureId = "3860099469" },
		{ MeshId = "127552124837034", Name = "Torso", Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.identity, TextureId = "14768664565" },
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },
		{ MeshId = "13778226115", Name = "Torso", Offset = CFrame.identity, TextureId = "13779858015" },
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.identity, TextureId = "4819722776" },
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = true,
		PredictionFling = false,
		Timeout = 4,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = true,
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = true,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
})

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Empyrean.Rig;
if Char:FindFirstChild("Accessory (VoidRPG)") then
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.C1 = CF.N(-.5,0,-1) * CF.A(0,math.rad(90),math.rad(-45))
end
if Char:FindFirstChild("Accessory (VoidAlligatorJaw)") then
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.C1 = CF.N(-.5,-5,-1.05) * CF.A(0,math.rad(90),math.rad(-135))
end
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/64),4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/64),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(20+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.7+-0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(20+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.7+0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(-20+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/64),4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/64),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(20+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.7+-0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(20+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.7+0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(-20+0*M.S(Sine/24))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

chillvoid2=function()
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 117311153426168,116940095199813 meowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeow")
local Global = (getgenv and getgenv()) or shared
Global.GelatekReanimateConfig = {
    -- [[ Rig Settings ]] --
    ["AnimationsDisabled"] = false,
    ["R15ToR6"] = true,
    ["DontBreakHairWelds"] = true,
    ["PermanentDeath"] = true,
    ["Headless"] = true,
    ["TeleportBackWhenVoided"] = false,
    
    -- [[ Reanimation Settings ]] --
    ["AlignReanimate"] = false,
    ["FullForceAlign"] = false,
    ["FasterHeartbeat"] = false,
    ["DynamicalVelocity"] = false,
    ["DisableTweaks"] = false,
    
    -- [[ Optimization ]] --
    ["OptimizeGame"] = false,

    -- [[ Miscellacious ]] --
    ["LoadLibrary"] = false,
    ["DetailedCredits"] = false,
    
    -- [[ Flinging Methods ]] --
    ["TorsoFling"] = true,
    ["BulletEnabled"] = true,
    ["BulletConfig"] = {
        ["RunAfterReanimate"] = true,
        ["LockBulletOnTorso"] = true
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Main.lua"))()

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Plr.Character;
if Char:FindFirstChild("Accessory (VoidRPG)") then
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.C1 = CF.N(-.5,0,-1) * CF.A(0,math.rad(90),math.rad(-45))
end
if Char:FindFirstChild("Accessory (VoidAlligatorJaw)") then
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.C1 = CF.N(-.5,-5,-1.05) * CF.A(0,math.rad(90),math.rad(-135))
end
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/64),4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/64),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(20+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.7+-0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(20+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.7+0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(-20+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/64),4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/64),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(20+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.7+-0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(20+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.7+0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(-20+0*M.S(Sine/24))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

amongus1=function()
do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BacekndAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					ApplyDescription(RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Vector3zero = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local RootPartCFrame = RigHumanoidRootPart.CFrame - HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if Humanoid then
				ChangeState(Humanoid, Dead)
				Wait(Humanoid.Died)
			end

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = false
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						UnequipTools(Humanoid)
						taskwait()
						EquipTool(Humanoid, Tool)

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end

		if IsRegistered then
			SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
		else
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		{ MeshId = "117287001096396", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "120169691545791" },
		{ MeshId = "137702817952968", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "135650240593878" },
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "12344206657", Name = "Right Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344206675" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.identity, TextureId = "3360974849" },
		{ MeshId = "12344207333", Name = "Left Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344207341" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.identity, TextureId = "3360978739" },
		{ MeshId = "121304376791439", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "73798034827573" },
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11263219250" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.identity, TextureId = "3650205764" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11159284657" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.identity, TextureId = "3860099469" },
		{ MeshId = "127552124837034", Name = "Torso", Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.identity, TextureId = "14768664565" },
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },
		{ MeshId = "13778226115", Name = "Torso", Offset = CFrame.identity, TextureId = "13779858015" },
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.identity, TextureId = "4819722776" },
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = true,
		PredictionFling = false,
		Timeout = 4,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = true,
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = true,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
})

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Empyrean.Rig;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+10*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),0.5+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+10*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),0.5+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+0.5*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+-0.5*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

amongus2=function()
local Global = (getgenv and getgenv()) or shared
Global.GelatekReanimateConfig = {
    -- [[ Rig Settings ]] --
    ["AnimationsDisabled"] = false,
    ["R15ToR6"] = true,
    ["DontBreakHairWelds"] = true,
    ["PermanentDeath"] = true,
    ["Headless"] = true,
    ["TeleportBackWhenVoided"] = false,
    
    -- [[ Reanimation Settings ]] --
    ["AlignReanimate"] = false,
    ["FullForceAlign"] = false,
    ["FasterHeartbeat"] = false,
    ["DynamicalVelocity"] = false,
    ["DisableTweaks"] = false,
    
    -- [[ Optimization ]] --
    ["OptimizeGame"] = false,

    -- [[ Miscellacious ]] --
    ["LoadLibrary"] = false,
    ["DetailedCredits"] = false,
    
    -- [[ Flinging Methods ]] --
    ["TorsoFling"] = true,
    ["BulletEnabled"] = true,
    ["BulletConfig"] = {
        ["RunAfterReanimate"] = true,
        ["LockBulletOnTorso"] = true
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Main.lua"))()

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Plr.Character;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+10*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),0.5+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+10*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),0.5+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+0.5*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+-0.5*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

doll1=function()
game.StarterGui:SetCore("SendNotification",{
	Title = "meowhook | Doll";
	Text = "It is recommended to not wear any hats"
})
do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BacekndAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					ApplyDescription(RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Vector3zero = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local RootPartCFrame = RigHumanoidRootPart.CFrame - HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if Humanoid then
				ChangeState(Humanoid, Dead)
				Wait(Humanoid.Died)
			end

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = false
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						UnequipTools(Humanoid)
						taskwait()
						EquipTool(Humanoid, Tool)

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end

		if IsRegistered then
			SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
		else
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		{ MeshId = "117287001096396", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "120169691545791" },
		{ MeshId = "137702817952968", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "135650240593878" },
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "12344206657", Name = "Right Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344206675" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.identity, TextureId = "3360974849" },
		{ MeshId = "12344207333", Name = "Left Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344207341" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.identity, TextureId = "3360978739" },
		{ MeshId = "121304376791439", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "73798034827573" },
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11263219250" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.identity, TextureId = "3650205764" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11159284657" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.identity, TextureId = "3860099469" },
		{ MeshId = "127552124837034", Name = "Torso", Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.identity, TextureId = "14768664565" },
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },
		{ MeshId = "13778226115", Name = "Torso", Offset = CFrame.identity, TextureId = "13779858015" },
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.identity, TextureId = "4819722776" },
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = true,
		PredictionFling = false,
		Timeout = 4,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = true,
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = true,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
})

task.wait(2)

DoingAction = false
ActionType = 0
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(kai)
	key = kai:lower()
	if key == "q" then
		DoingAction = false
		ActionType = 0
    elseif key == "e" then
        DoingAction = true
        ActionType = 1
	end
end)
local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Empyrean.Rig;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle') and DoingAction == false then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Idle') and DoingAction == true then
	if ActionType == 1 then
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),-2+0*M.S(Sine/24), -2+1*M.S(Sine/10)) * CF.A(M.R(-90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),-0.2+0*M.S(Sine/24), -1+1*M.S(Sine/10)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),-0.2+0*M.S(Sine/24), -1+1*M.S(Sine/10)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
	end
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+0.5*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+-0.5*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

doll2=function()
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 5100144397 meowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeow")
game.StarterGui:SetCore("SendNotification",{
	Title = "meowhook | Doll";
	Text = "It is recommended to not wear any hats"
})
local Global = (getgenv and getgenv()) or shared
Global.GelatekReanimateConfig = {
    -- [[ Rig Settings ]] --
    ["AnimationsDisabled"] = false,
    ["R15ToR6"] = true,
    ["DontBreakHairWelds"] = true,
    ["PermanentDeath"] = true,
    ["Headless"] = true,
    ["TeleportBackWhenVoided"] = false,
    
    -- [[ Reanimation Settings ]] --
    ["AlignReanimate"] = false,
    ["FullForceAlign"] = false,
    ["FasterHeartbeat"] = false,
    ["DynamicalVelocity"] = false,
    ["DisableTweaks"] = false,
    
    -- [[ Optimization ]] --
    ["OptimizeGame"] = false,

    -- [[ Miscellacious ]] --
    ["LoadLibrary"] = false,
    ["DetailedCredits"] = false,
    
    -- [[ Flinging Methods ]] --
    ["TorsoFling"] = true,
    ["BulletEnabled"] = true,
    ["BulletConfig"] = {
        ["RunAfterReanimate"] = true,
        ["LockBulletOnTorso"] = true
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Main.lua"))()

task.wait(2)

DoingAction = false
ActionType = 0
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(kai)
	key = kai:lower()
	if key == "q" then
		DoingAction = false
		ActionType = 0
    elseif key == "e" then
        DoingAction = true
        ActionType = 1
	end
end)
local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Plr.Character;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle') and DoingAction == false then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Idle') and DoingAction == true then
	if ActionType == 1 then
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),-2+0*M.S(Sine/24), -2+1*M.S(Sine/10)) * CF.A(M.R(-90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),-0.2+0*M.S(Sine/24), -1+1*M.S(Sine/10)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),-0.2+0*M.S(Sine/24), -1+1*M.S(Sine/10)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
	end
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+0.5*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+-0.5*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

purplelighting1=function()
	game.Lighting.Ambient = Color3.fromRGB(111, 0, 222)
	game.Lighting.OutdoorAmbient = Color3.fromRGB(111, 0, 222)
	game.Lighting.EnvironmentDiffuseScale = 1
	game.Lighting.EnvironmentSpecularScale = 1
	game.Lighting.Brightness = 2
end

baseplate=Instance.new("Part")
baseplate.Parent=game.Workspace
baseplate.Anchored=true
baseplate.CFrame=CFrame.new(0,640,0)
baseplate.Size=Vector3.new(64,1.2,64)
baseplate.Color=Color3.fromRGB(91,91,91)
spawn=Instance.new("Part")
spawn.Parent=game.Workspace
spawn.Anchored=true
spawn.CFrame=CFrame.new(0,640.5,0)
spawn.Size=Vector3.new(12,1.2,12)
decal=Instance.new("Decal")
decal.Parent=spawn
decal.Texture='rbxasset://textures/SpawnLocation.png'
decal.Face='Top'
texture=Instance.new("Texture")
texture.Parent=baseplate
texture.Transparency=.8
texture.StudsPerTileU=8
texture.StudsPerTileV=8
texture.Texture='rbxassetid://6372755229'
texture.Face='Top'
texture.Color3 = Color3.fromRGB(0,0,0)

teleport1=function()
	game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(0,660,0)
end

dafeets1=function()
    do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BacekndAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					ApplyDescription(RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Vector3zero = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local RootPartCFrame = RigHumanoidRootPart.CFrame - HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if Humanoid then
				ChangeState(Humanoid, Dead)
				Wait(Humanoid.Died)
			end

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = false
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						UnequipTools(Humanoid)
						taskwait()
						EquipTool(Humanoid, Tool)

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end

		if IsRegistered then
			SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
		else
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		{ MeshId = "117287001096396", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "120169691545791" },
		{ MeshId = "137702817952968", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "135650240593878" },
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "12344206657", Name = "Right Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344206675" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.identity, TextureId = "3360974849" },
		{ MeshId = "12344207333", Name = "Left Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344207341" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.identity, TextureId = "3360978739" },
		{ MeshId = "121304376791439", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "73798034827573" },
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11263219250" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.identity, TextureId = "3650205764" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11159284657" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.identity, TextureId = "3860099469" },
		{ MeshId = "127552124837034", Name = "Torso", Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.identity, TextureId = "14768664565" },
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },
		{ MeshId = "13778226115", Name = "Torso", Offset = CFrame.identity, TextureId = "13779858015" },
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.identity, TextureId = "4819722776" },
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = true,
		PredictionFling = false,
		Timeout = 4,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = true,
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = true,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
})

task.wait(2)

local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local V3 = {N=Vector3.new};
local S = game
local R3 = Region3.new
local De = S.Debris
local WS = workspace
local Lght = S.Lighting
local RepS = S.ReplicatedStorage
local IN = Instance.new
local Plrs = S.Players

--// INITIALIZATION --
local Plr = Plrs.LocalPlayer
print(Plr)
local Char = Empyrean.Rig
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a valid Humanoid instance! (Exising and R6)")
local Head = Char.Head
local RArm = Char["Right Arm"]
local LArm = Char["Left Arm"]
local RLeg = Char["Right Leg"]
local LLeg = Char["Left Leg"]	
local Torso= Char.Torso
local Root = Char.HumanoidRootPart
local NeutralAnims = true
local Attack = false
local legAnims = true
local Mouse = Plr:GetMouse()
local EffectFolder=Instance.new("Folder")
EffectFolder.Name='Effects'
EffectFolder.Parent=Char

local Movement = 10
local Sine = 0;
local Change = 1;
local wsVal = 6

--// INSTANCE CREATORS --
local baseSound = IN("Sound")
function Sound(parent,id,pitch,volume,looped,effect,autoPlay)
	local Sound = baseSound:Clone()
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			Sound:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent =parent or workspace
	return Sound
end
function Part(parent,color,material,size,cframe,anchored,cancollide)
	local part = IN("Part")
	part[typeof(color) == 'BrickColor' and 'BrickColor' or 'Color'] = color or C3.N(0,0,0)
	part.Material = material or Enum.Material.SmoothPlastic
	part.TopSurface,part.BottomSurface=10,10
	part.Size = size or V3.N(1,1,1)
	part.CFrame = cframe or CF.N(0,0,0)
	part.CanCollide = cancollide or false
	part.Anchored = anchored or false
	part.Parent = parent
	return part
end

function Weld(part0,part1,c0,c1)
	local weld = IN("Weld")
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0 or CF.N()
	weld.C1 = c1 or CF.N()
	weld.Parent = part0
	return weld
end

function Mesh(parent,meshtype,meshid,textid,scale,offset)
	local part = IN("SpecialMesh")
	part.MeshId = meshid or ""
	part.TextureId = textid or ""
	part.Scale = scale or V3.N(1,1,1)
	part.Offset = offset or V3.N(0,0,0)
	part.MeshType = meshtype or Enum.MeshType.Sphere
	part.Parent = parent
	return part
end

function SoundPart(id,pitch,volume,looped,effect,autoPlay,cf)
	local soundPart = Part(EffectFolder,C3.N(1,1,1),Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),cf,true,false)
	soundPart.Transparency=1
	local Sound = IN("Sound")
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			soundPart:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent = soundPart
	return Sound
end

function Joint(name,part0,part1,c0,c1,type)
	local joint = IN(type or "Motor6D")
	joint.Part0 = part0
	joint.Part1 = part1
	joint.C0 = c0 or CF.N()
	joint.C1 = c1 or CF.N()
	joint.Parent=part0
	joint.Name=name or part0.." to "..part1.." "..joint.ClassName
	return joint
end

function Animate(joint,c0,alpha,style,dir)
	if(style=='Lerp')then
		joint.C0 = joint.C0:lerp(c0,alpha)
	else
		local info = TweenInfo.new(alpha or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
		local tween = S.TweenService:Create(joint,info,{C0=c0})
		tween:Play();
		return tween;
	end
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end

function GetAdjacentParts(part)
	local function createLargerHitbox(part)
		local n = 0.2
		local clone = part:Clone()
		
		clone.Transparency = .8
		clone.BrickColor = BrickColor.Red()
		clone.Size = clone.Size + Vector3.new(n, n, n)
		clone.Name = "hitbox"
		clone.CFrame = part.CFrame
		clone.Anchored=true
		clone.CanCollide=true
		
		if (clone:IsA("WedgePart")) then
			clone.Size = clone.Size + Vector3.new(0, n, n)
			clone.CFrame = part.CFrame * CFrame.new(0, n / 2, -n /2)
		end
		
		if (clone:IsA("CornerWedgePart")) then
			clone.Size = clone.Size + Vector3.new(n, n, n)
			clone.CFrame = part.CFrame * CFrame.new(-n / 2, n / 2, n / 2)
		end
		clone.Parent = part
		
		return clone
	end
	
	local hitbox = createLargerHitbox(part)
	local touchingParts = hitbox:getTouchingParts()
	hitbox:Destroy()
	
	return (function()
		local adjacent={}
		for _,v in next, touchingParts do if(v~=part)then table.insert(adjacent,v)end;end
		return adjacent;
	end)()
end
--// CUSTOMIZABLE VARIABLES --

local DamageColor = BrickColor.new'Really red';
local MusicData = {Parent=Torso,ID=2666435584;Pitch=1;Volume=5;}
local God = false
local WalkSpeed = 50

local Music = Sound(MusicData.Parent,MusicData.ID,MusicData.Pitch,MusicData.Volume,true,false,true)
Music.Name = 'Music'

--// JOINTS --

local RJ = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
local NK = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
local LS = Joint("Left Shoulder",Torso,LArm,CF.N(-.5,-2,0),CF.N(0,.5,0))
local RS = Joint("Right Shoulder",Torso,RArm,CF.N(.5,-2,0),CF.N(0,.5,0))
local LH = Joint("Left Hip",Torso,LLeg,CF.N(0,0,0),CF.N(0,0,0))
local RH = Joint("Right Hip",Torso,RLeg,CF.N(0,0,0),CF.N(0,0,0))

--Torso.Anchored = true

local LSC0 = LS.C0
local RSC0 = RS.C0
local NKC0 = NK.C0
local LHC0 = LH.C0
local RHC0 = RH.C0
local RJC0 = RJ.C0

--// Artificial HB --

local ArtificialHB = IN("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

script:WaitForChild("Heartbeat")

local tf = 0
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
local frame = 1/60
ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

--// STOP ANIMATIONS --
for _,v in next, Hum:GetPlayingAnimationTracks() do
	v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

--// EFFECT FUNCTIONS --



local fromaxisangle = function(x, y, z) -- credit to phantom forces devs
	if not y then
		x, y, z = x.x, x.y, x.z
	end
	local m = (x * x + y * y + z * z) ^ 0.5
	if m > 1.0E-5 then
		local si = math.sin(m / 2) / m
		return CFrame.new(0, 0, 0, si * x, si * y, si * z, math.cos(m / 2))
	else
		return CFrame.new()
	end
end

function fakePhysics(elapsed,cframe,velocity,rotation,acceleration)
	local pos = cframe.p
	local matrix = cframe-pos
	return fromaxisangle(elapsed*rotation)*matrix+pos+elapsed*velocity+elapsed*elapsed*acceleration
end

function CastRay(startPos,endPos,range,ignoreList)
	local ray = Ray.new(startPos,(endPos-startPos).unit*range)
	local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {},false,true)
	return part,pos,norm,(pos and (startPos-pos).magnitude)
end

function GetTorso(char)
	return char:FindFirstChild'Torso' or char:FindFirstChild'UpperTorso' or char:FindFirstChild'LowerTorso' or char:FindFirstChild'HumanoidRootPart'
end

function Projectile(data)
	local Size = data.Size or 1;
	local Origin = data.Origin or CFrame.new();
	local Velocity = data.Velocity or Vector3.new(0,100,0);
	local Gravity = data.Gravity or workspace.Gravity;
	local Color = data.Color or Color3.new(.7,0,0);
	local Lifetime = data.Lifetime or 1;
	local Material = data.Material or Enum.Material.Glass;
	local ignore = data.Ignorelist or {Char};
	local Init = data.Init;
	local Update = data.Update;
	local HitFunc = data.Hit;
	local ShouldCollide = data.BeforeCollision;
	local DeleteOnHit = not not data.DeleteOnHit;
	local ProjectilePart = data.Projectile or nil;
	local Look = data.AimAtPos or false;
	local drop = ProjectilePart or Part(nil,Color,Material,Vector3.new(Size,Size,Size),Origin,true,false)
	local StartTravel = tick()
	local currCF = data.Origin
	if(not ProjectilePart)then
		Mesh(drop,Enum.MeshType.Sphere)
		drop.Parent=EffectFolder
	end
	drop.Material = Material
	drop.Color = Color
	drop.CFrame=Origin
	local object=setmetatable({Part=drop},{
		__newindex=function(s,i,v)
			if(i=='Gravity')then StartTravel = tick() data.Origin = currCF Origin=currCF data.Gravity = v Gravity=v
			elseif(i=='Velocity')then StartTravel = tick() data.Origin = currCF Origin=currCF data.Velocity = v Velocity=v
			elseif(i=='Lifetime')then data.Lifetime = v Lifetime=v 
			elseif(i=='Ignorelist')then data.Ignorelist = v ignore=v
			elseif(i=='DeleteOnHit')then data.DeleteOnHit = v DeleteOnHit=v 
			else
				pcall(function()
					drop[i]=v
				end)
			end
		end;
		__index=data;
	})
	
	
	if(Init)then
		Init(drop)
	end
	local startTick = tick();
	coroutine.wrap(function()
		while true do
			local elapsed = tick()-startTick
			local trElapsed = tick()-StartTravel
			if(elapsed>Lifetime)then
				drop:destroy();
				break
			end
			local newCF = fakePhysics(trElapsed,Origin,Velocity,Vector3.new(),Vector3.new(0,-Gravity,0))
			local nextCF = fakePhysics(trElapsed+.05,Origin,Velocity,Vector3.new(),Vector3.new(0,-Gravity,0))
			local dist = (drop.Position-newCF.p).magnitude
			local hit,pos,norm = CastRay(drop.Position,newCF.p,dist,ignore)
			currCF=newCF
			local doCollide = hit and (GetTorso(hit.Parent) or hit.CanCollide) and (not ShouldCollide or ShouldCollide(hit))
			if(hit and not doCollide)then table.insert(ignore,hit) end
			if(Look)then
				drop.CFrame = CFrame.new(newCF.p,nextCF.p)
			else
				drop.CFrame = CFrame.new(newCF.p)
			end
			if(Update)then Update(drop,object,elapsed) end
			if(doCollide)then
				if(DeleteOnHit or not HitFunc)then drop:destroy() end
				if(HitFunc)then if(HitFunc(hit,pos,norm,object,drop))then break end end
			end
			if(not drop.Parent)then
				break
			end
			swait()
		end
	end)()
	return object
	end
	
function Chat(txt,timer,clr)
	if(Head:FindFirstChild'Chattie' and Head.Chattie:FindFirstChild'Killchat')then
		Head.Chattie.Killchat.Value=true
	elseif(Head:FindFirstChild'Chattie')then
		Head.Chattie:destroy()
	end
	local nig = V3.N(0,0,0)
	local clr = (typeof(clr)=='BrickColor' and clr.Color or typeof(clr)=='Color3' and clr or C3.N(1,1,1))
	local bg = NewInstance("BillboardGui",Head,{
		Name='Chattie';
		Adornee=Head;
		LightInfluence=0;
		Size=UDim2.new(4,0,2,0);
	})
	local dismiss = NewInstance("BoolValue",bg,{
		Name='Killchat';
	})
	
	local text = NewInstance("TextLabel",bg,{
		BackgroundTransparency=1;
		Size=UDim2.new(1,0,1,0);
		Font=Enum.Font.Fantasy;
		Text=txt;
		TextColor3=clr;
		TextStrokeColor3=C3.N(0,0,0);
		TextScaled=true;
		TextTransparency=0;
		TextStrokeTransparency=.5;
	})
	coroutine.wrap(function()
		for i = 1, 0, -.02 do
			bg.StudsOffsetWorldSpace=nig:lerp(nig+V3.N(0,3,0),EasingFunctions.outBack(1-i,0,1,1,6))
			if(dismiss.Value)then break end
			swait()
		end
		local start = tick()
		nig=bg.StudsOffsetWorldSpace
		repeat swait() until dismiss.Value or tick()-start>=timer
		bg.Name='DismissingChat'
		for i = 0, 1, .05 do
			bg.StudsOffsetWorldSpace=nig:lerp(nig+V3.N(0,2,0),EasingFunctions.linear(i,0,1,1))
			text.TextTransparency=i;
			text.TextStrokeTransparency=.5+i/2;
			swait()
		end
		bg:destroy()
	end)()
end

function ShowDamage(pos,txt,timer,clr)
	local nig = typeof(pos)=='Vector3' and CF.N(pos) or pos
	local part = Part(EffectFolder,clr,Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),nig,true,false)
	part.Transparency=1
	local bg = NewInstance("BillboardGui",part,{
		Adornee=part;
		LightInfluence=0;
		Size=UDim2.new(2,0,1,0);
	})
	local text = NewInstance("TextLabel",bg,{
		BackgroundTransparency=1;
		Size=UDim2.new(1,0,1,0);
		Font=Enum.Font.Fantasy;
		Text=txt;
		TextColor3=part.Color;
		TextStrokeColor3=C3.N(0,0,0);
		TextScaled=true;
		TextTransparency=1;
		TextStrokeTransparency=1;
	})
	coroutine.wrap(function()
		for i = 1, 0, -.02 do
			part.CFrame=nig:lerp(nig+V3.N(0,3,0),EasingFunctions.outBack(1-i,0,1,1,6))
			text.TextTransparency=i;
			text.TextTransparency=text.TextTransparency-.02;
			text.TextStrokeTransparency=text.TextStrokeTransparency-.01;
			swait()
		end
		local start = tick()
		repeat swait() until tick()-start>=timer
		local endRot=M.RNG(-25,25)
		for i = 0, 1, .02 do
			part.CFrame=(nig+V3.N(0,3,0)):lerp(nig+V3.N(0,-10,0),EasingFunctions.inBack(i,0,1,1,6))
			text.TextTransparency=i;
			text.TextTransparency=text.TextTransparency+.02;
			text.TextStrokeTransparency=text.TextStrokeTransparency+.01;
			swait()
		end
		part:destroy()
	end)()
end

function CamshakePlayer(p,settings)
	local sh = script:WaitForChild'CamShake':Clone()	
	local optionFolder = sh:WaitForChild'Options'
	for _,v in next, optionFolder:children() do
		if(settings[v.Name])then
			v.Value=settings[v.Name]
		end
	end
	local originVal;
	if(typeof(settings.Origin)=='Vector3')then
		originVal=IN("Vector3Value")
	elseif(typeof(settings.Origin)=='CFrame')then
		originVal=IN("CFrameValue")
	elseif(typeof(settings.Origin)=='Instance')then
		originVal=IN("ObjectValue")
	end
	if(originVal)then
		originVal.Name = 'Origin'
		originVal.Value = settings.Origin
		originVal.Parent=optionFolder
	end
	local parent = p.Character or p:FindFirstChildOfClass'Backpack' or p:FindFirstChildOfClass'PlayerGui'
	if(parent)then
		local nig = sh:Clone();
		nig.Parent=parent
		nig.Disabled=false
		S.Debris:AddItem(nig,(settings.Duration or 2)+1)
	end
end

function Camshake(settings)
	for _,p in next, game:service'Players':players() do
		CamshakePlayer(p,settings)
	end
end
function Tween(object,properties,time,style,dir,repeats,reverse,delay)
	local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
	local tween = S.TweenService:Create(object,info,properties)
	tween:Play()
	return tween;
end

local function numLerp(Start,Finish,Alpha)
    return Start + (Finish- Start) * Alpha
end
function IsValidEnum(val,enum,def)
	local enum = Enum[tostring(enum)]
	local succ,err=pcall(function() return enum[val.Name] end)
	if(not err)then
		return val
	else
		return def
	end
end

function IsValid(val,type,def)
	if(typeof(type)=='string')then
		return (typeof(val)==type and val or def)
	elseif(typeof(type)=='table')then
		for i,v in next, type do
			if(typeof(val)==v)then
				return val
			end
		end
	end
	return def
end

local FXInformation = {}
function EffectFunc(data)
	if(typeof(data)=='Instance' and data:IsA'ModuleScript')then	data=require(data)end
	assert(typeof(data)=='table',"Expected 'table' calling EffectFunc")
	data.Parent=EffectFolder
	if(data.BeamEffect)then
		return Slash(data)
	end
	
	local Lifetime = data.Lifetime or 1;
	local Color = data.Color or Color3.new(1,1,1)
	local EndColor = data.EndColor
	local Size = data.Size or Vector3.new(1,1,1)
	local EndSize = data.EndSize
	local Transparency = data.Transparency or 0
	local EndTransparency = data.EndTransparency or 1
	local Material = data.Material or Enum.Material.Neon;
	local Part = typeof(data.RefPart)=='Instance' and data.RefPart or typeof(data.RefPart)=='string' and FXFolder:FindFirstChild(data.RefPart);
	local CF = data.CFrame or CFrame.new(0,10,0)
	local EndCF = data.EndCFrame or data.EndPos
	local Mesh = data.MeshData or data.Mesh or {MeshType=Enum.MeshType.Brick}
	local Rotation = data.Rotation or {0,0,0}
	local UpdateCF = data.UpdateCFrame;
	local Update = data.Update;
	
	local CSQ,SSQ,TSQ,CFQ;
	if(typeof(Color)=='BrickColor')then Color = Color.Color end
	if(typeof(EndColor)=='BrickColor')then EndColor = EndColor.Color end
	if(typeof(Color)=='ColorSequence')then
		CSQ = Color
	elseif(typeof(Color)=='Color3' and typeof(EndColor)=='Color3')then
		CSQ = ColorSequence.new(Color,EndColor)
	elseif(typeof(Color)=='Color3')then
		CSQ = ColorSequence.new(Color)
	else
		CSQ = ColorSequence.new(Color3.new(1,1,1))
	end
	
	
	if(typeof(Size)=='table' and Size.Keypoints and typeof(Size.Keypoints[1].Value)=='Vector3')then
		SSQ = Size
	elseif(typeof(Size)=='Vector3' and typeof(EndSize)=='Vector3')then
		SSQ = Vector3Sequence.new(Size,EndSize)
	elseif(typeof(Size)=='Vector3')then
		SSQ = Vector3Sequence.new(Size)
	else
		SSQ = Vector3Sequence.new(Vector3.new(1,1,1))
	end
	
	if(typeof(CF)=='table' and CF.Keypoints and typeof(CF.Keypoints[1].Value)=='CFrame')then
		CFQ = CF
	elseif(typeof(CF)=='CFrame' and typeof(EndCF)=='CFrame')then
		CFQ = CFrameSequence.new(CF,EndCF)
	elseif(typeof(CF)=='CFrame')then
		CFQ = CFrameSequence.new(CF)
	else
		CFQ = CFrameSequence.new(CFrame.new(0,10,0))
	end
		
	if(typeof(Transparency)=='NumberSequence')then
		TSQ = Transparency
	elseif(typeof(Transparency)=='number' and typeof(EndTransparency)=='number')then
		TSQ = NumberSequence.new(Transparency,EndTransparency)
	elseif(typeof(Transparency)=='number')then
		TSQ = NumberSequence.new(Transparency)
	else
		TSQ = NumberSequence.new(0,1)
	end
	
	
	local part,mesh;
	if(not Part or not Part:IsA'BasePart')then
		part = Instance.new("Part")
		mesh = Instance.new("SpecialMesh",part)
	else
		part=Part:Clone();
		mesh=part:FindFirstChildOfClass'DataModelMesh'
	end
	part.Color = CSQ.Keypoints[1].Value
	part.Transparency = TSQ.Keypoints[1].Value
	part.Size = (not mesh and SSQ.Keypoints[1].Value or Vector3.new(1,1,1))
	part.Anchored = true
	part.CanCollide = false
	part.CFrame = CFQ.Keypoints[1].Value
	part.Material = Material
	part.Locked = true
	part.Parent = EffectFolder
	if(mesh)then
		mesh.Scale = SSQ.Keypoints[1].Value
		mesh.MeshType = Mesh.MeshType or Mesh.Type or Enum.MeshType.Brick
		mesh.MeshId = Mesh.MeshId or Mesh.Id or ""
		mesh.TextureId = Mesh.TextureId or Mesh.Texture or ""
	end
	game:service'Debris':AddItem(part,Lifetime*1.5)
	table.insert(FXInformation,{
		Part=part;
		Mesh=mesh;
		Lifetime=Lifetime;
		Create=tick();
		ColorSeq=CSQ;
		SizeSeq=SSQ;
		TranSeq=TSQ;
		CFSeq=CFQ;
		ColorPoint=CSQ.Keypoints[1];
		SizePoint=SSQ.Keypoints[1];
		TranPoint=TSQ.Keypoints[1];
		CFPoint=CFQ.Keypoints[1];
		Rotation=Rotation;
		CurrRot=CFrame.new();
		UpdateCF=(typeof(UpdateCF)=='function' and UpdateCF or typeof(UpdateCF)=='Instance' and UpdateCF:IsA'ModuleScript' and require(UpdateCF) or nil);
		OnUpdate=(typeof(Update)=='function' and Update or typeof(Update)=='Instance' and Update:IsA'ModuleScript' and require(Update) or nil)
	})
end

function GetKeyframe(sequence,currentTime,lifeTime)
	local scale = currentTime/lifeTime
	for i = 1,#sequence.Keypoints do
		local keyframe = sequence.Keypoints[i]
		local nframe = sequence.Keypoints[i+1]
		if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
			return keyframe
		end
	end
	return sequence.Keypoints[1];
end;

coroutine.wrap(function()
	while true do
		swait()
		local queue={}
		for i,dat in next, FXInformation do
			local part,mesh,lifetime,created,csq,ssq,tsq,cfq,rot,ucf,upd = 
																	dat.Part,
																	dat.Mesh,
																	dat.Lifetime,
																	dat.Create,
																	dat.ColorSeq,
																	dat.SizeSeq,
																	dat.TranSeq,
																	dat.CFSeq,
																	dat.Rotation,
																	dat.UpdateCF,
																	dat.OnUpdate;
			local current = tick();
			local elapsed = tick()-created
			local currentcpoint = GetKeyframe(csq,elapsed,lifetime)
			local currentspoint = GetKeyframe(ssq,elapsed,lifetime)
			local currenttpoint = GetKeyframe(tsq,elapsed,lifetime)
			local currentcfpoint = GetKeyframe(cfq,elapsed,lifetime)
			
			local currentcolor = currentcpoint.Value
			local currenttrans = currenttpoint.Value
			local currentsize = currentspoint.Value
			local currentcf = currentcfpoint.Value
			
			if(currentcpoint~=dat.ColorPoint)then
				Tween(part,{Color=currentcolor},(currentcpoint.Time-dat.ColorPoint.Time)*lifetime)
				dat.ColorPoint=currentcpoint
			end
			if(currenttpoint~=dat.TranPoint)then
				Tween(part,{Transparency=currenttrans},(currenttpoint.Time-dat.TranPoint.Time)*lifetime)
				dat.TranPoint=currenttpoint
			end
			if(currentspoint~=dat.SizePoint)then
				if(mesh)then
					Tween(mesh,{Scale=currentsize},(currentspoint.Time-dat.SizePoint.Time)*lifetime)
				else
					Tween(part,{Size=currentsize},(currentspoint.Time-dat.SizePoint.Time)*lifetime)
				end
				
				dat.SizePoint=currentspoint
			end
			local newRot={0,0,0}
			if(rot=='random')then
				dat.CurrRot = CFrame.Angles(math.rad(Random.new():NextInteger(0,360)),math.rad(Random.new():NextInteger(0,360)),math.rad(Random.new():NextInteger(0,360)))
			elseif(typeof(rot)=='table')then
				dat.CurrRot = dat.CurrRot*CFrame.Angles(math.rad(rot[1]),math.rad(rot[2]),math.rad(rot[3]))
			end
			if(ucf and typeof(ucf)=='function')then
				part.CFrame=ucf(dat)
			elseif(#cfq.Keypoints==2)then
				part.CFrame=cfq.Keypoints[1].Value:lerp(cfq.Keypoints[2].Value,elapsed/lifetime)*dat.CurrRot
			else
				if(currentcfpoint~=dat.CFPoint)then
					Tween(part,{CFrame=currentcf},(currentcfpoint.Time-dat.CFPoint.Time)*lifetime)
					dat.CFPoint=currentcfpoint
				end
			end
			if(typeof(upd)=='function')then upd(dat) end
			if(not part or not part.Parent)then
				table.insert(queue,tostring(i))
			end
			if(elapsed>=lifetime)then
				part:destroy()
			end
		end
		for _,v in next, queue do FXInformation[tonumber(v)]=nil; end
	end
end)()

function Slash(data) -- Credit to Kyu for the basic idea behind it
	local Parent = IsValid(data.Parent,'Instance',workspace)
	local Color = IsValid(data.Color,{'Color3','BrickColor'},Color3.new(1,1,1))
	local Width = IsValid(data.Width,'number',2);
	local EndWidth = IsValid(data.EndWidth,'number',0);
	local Length = IsValid(data.Length,'number',1);
	local EndLength = IsValid(data.EndLength,'number',Length*2);
	local Curve = IsValid(data.Curve,"number",2);
	local EndCurve = IsValid(data.EndCurve,"number",Curve*2);
	local SCFrame = IsValid(data.CFrame,'CFrame',CFrame.new(0,10,0))
	local Lifetime = IsValid(data.Lifetime,'number',.25)
	local Offset = IsValid(data.Offset,'CFrame',CFrame.new())
	local Style = IsValidEnum(IsValid(data.EasingStyle,'EnumItem',Enum.EasingStyle.Quad),Enum.EasingStyle,Enum.EasingStyle.Quad)
	local Direction = IsValidEnum(IsValid(data.EasingDirection,'EnumItem',Enum.EasingDirection.Out),Enum.EasingDirection,Enum.EasingDirection.Out)
	local Delay = IsValid(data.Delay,'number',0)
	local BeamProperties = IsValid(data.BeamProps,'table',{})
	local FadeAway = IsValid(data.Fades,'boolean',false)
	local FadeStyle = IsValidEnum(IsValid(data.FadeStyle,'EnumItem',Enum.EasingStyle.Linear),Enum.EasingStyle,Enum.EasingStyle.Linear)
	local FadeDir = IsValidEnum(IsValid(data.FadeDirection,'EnumItem',Enum.EasingDirection.Out),Enum.EasingDirection,Enum.EasingDirection.Out)
	local CSQ;
	local TSQ;
	if(typeof(Color)=='ColorSequence')then
		CSQ = Color
	elseif(typeof(Color)=='Color3')then
		CSQ = ColorSequence.new(Color)
	elseif(typeof(Color)=='BrickColor')then
		CSQ = ColorSequence.new(Color.Color)
	else
		CSQ = ColorSequence.new(Color3.new(1,1,1))
	end
	
	local P = Part(Parent,Color,Enum.Material.SmoothPlastic,Vector3.new(0,0,0),SCFrame,true,false)
	P.Transparency = 1
	local A0 = Instance.new("Attachment")
	local A1 = Instance.new("Attachment")
	A0.Position = Vector3.new(0,0,Length)
	A1.Position = Vector3.new(0,0,-Length)
	A0.Parent=P
	A1.Parent=P
	local Beam = Instance.new("Beam")
	Beam.Attachment0=A0
	Beam.Attachment1=A1
	Beam.FaceCamera=true
	Beam.LightInfluence=BeamProperties.LightInfluence or 0
	Beam.LightEmission=BeamProperties.LightEmission or 1
	for i,v in next, BeamProperties do
		pcall(function() Beam[i]=v end)
	end
	Beam.Color = CSQ
	Beam.CurveSize0 = Curve
	Beam.CurveSize1 = -Curve
	Beam.Width0=Width
	Beam.Width1=Width
	Beam.Parent=P
	local ti = {Lifetime,Style,Direction,0,false,Delay}
	Tween(P,{CFrame = SCFrame*Offset},unpack(ti))
	Tween(Beam,{Width0=EndWidth,Width1=EndWidth,CurveSize0=EndCurve,CurveSize1=-EndCurve},unpack(ti))
	Tween(A0,{Position=Vector3.new(0,0,EndLength)},unpack(ti))
	Tween(A1,{Position=Vector3.new(0,0,-EndLength)},unpack(ti)).Completed:connect(function() P:destroy() end)
	if(FadeAway)then
		local part = Instance.new("Part")
		part.Transparency = Beam.Transparency.Keypoints[1].Value or 0
		Tween(part,{Transparency=1},Lifetime,FadeStyle,FadeDir,0,false,Delay)
		repeat swait()
			Beam.Transparency=NumberSequence.new(part.Transparency)
		until not P.Parent
	end
end

local EffectInfo={}
function Effect(data)
	local color = data.Color or Color3.new(1,1,1);
	local transparency = data.Transparency or {0,1}
	local lifetime = data.Lifetime or 1
	local cframe = data.CFrame or CFrame.new(0,10,0)
	local acceleration = data.Acceleration or Vector3.new(0,0,0)
	local endpos = data.EndPos
	local rotation = data.Rotation or {0,0,0}
	local meshData = data.Mesh or {Type=Enum.MeshType.Brick}
	local size = data.Size or Vector3.new(1,1,1)
	local material = data.Material or Enum.Material.Neon
	local setpart = typeof(data.Part)=='string' and FXFolder:FindFirstChild(tostring(data.Part)):Clone() or typeof(data.Part)=='Instance' and data.Part or nil
	local endSize = data.EndSize or size
	local reverse = data.Reverse or 0
	local sizeTween = data.TweenSize and EasingFunctions[data.TweenSize];
	local moveTween = data.TweenPos and EasingFunctions[data.TweenPos];
	local transTween = data.TweenTrans and EasingFunctions[data.TweenTrans];
	local accelTween = data.TweenAccel and EasingFunctions[data.TweenAccel];
	if(endSize and typeof(size)=='Vector3')then size={size,endSize} end
	if(typeof(size)=='Vector3')then size={size,size}end
	if(typeof(transparency)=='number')then transparency={transparency,transparency} end
	if(typeof(color)=='BrickColor')then color=color.Color end
	
	local PM;
	
	local part = setpart or Part(nil,color,material,Vector3.new(1,1,1),cframe,true,false)
	
	if(not part:IsA'MeshPart' and not part:IsA'UnionOperation')then
		local scale = size[1]
		if(meshData == "Blast")then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://20329976','',scale,Vector3.new(0,0,-scale.X/8))
		elseif(meshData == 'Ring')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://559831844','',scale,Vector3.new(0,0,0))
		elseif(meshData == 'Slash1')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://662586858','',Vector3.new(scale.X/10,.001,scale.Z/10),Vector3.new(0,0,0))
		elseif(meshData == 'Slash2')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://448386996','',Vector3.new(scale.X/1000,scale.Y/100,scale.Z/100),Vector3.new(0,0,0))
		elseif(meshData == 'Tornado1')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://443529437','',scale/10,Vector3.new(0,0,0))
		elseif(meshData == 'Tornado2')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://168892432','',scale/4,Vector3.new(0,0,0))
		elseif(meshData == 'Skull')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://4770583','',scale*2,Vector3.new(0,0,0))
		elseif(meshData == 'Crystal')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://9756362','',scale,Vector3.new(0,0,0))
		elseif(meshData == 'Cloud')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://1095708','',scale,Vector3.new(0,0,0))
		elseif(typeof(meshData) == 'table' or typeof(meshData) == 'Instance')then
			local Type = meshData.MeshType or meshData.Type or Enum.MeshType.Brick
			local ID = meshData.MeshId or meshData.Mesh or '';
			local Tex = meshData.TextureId or meshData.Texture or '';
			local Offset = meshData.Offset or Vector3.new(0,0,0)
			PM = Mesh(part,Type,ID,Tex,scale,Offset)
		elseif(not part:FindFirstChildOfClass('DataModelMesh'))then
			PM = Mesh(part,Enum.MeshType.Brick,'','',scale)
		else
			PM = part:FindFirstChildOfClass('DataModelMesh')
		end
	end
	
	
	part.Material = material
	part.CFrame = cframe
	part.Color = color
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = transparency[1]
	part.Size = (PM and Vector3.new(1,1,1) or size[1])
	part.Parent = EffectFolder
	
	local start = tick()
	local t0 = tick()
	local t01 = tick()
	local lastTrans='Nil';
	local lastSize='Nil';
	local lastColor='Nil';
	local info = {start,lifetime,t0,transTween,sizeTween,moveTween,accelTween,color,transparency,size,part,PM,rotation,acceleration,endpos,cframe,reverse,acceleration}
	table.insert(EffectInfo,info)
end

coroutine.wrap(function()
	while true do
		swait()
		for i,v in next, EffectInfo do
			local start,lifetime,t0,transTween,sizeTween,moveTween,accelTween,color,transparency,size,part,mesh,rotation,acceleration,endpos,cframe,reverse,startacc=unpack(v)
			local elapsed = tick()-start
			local left = elapsed/lifetime
			local dt = tick()-t0
			t0 = tick()
			if(mesh)then
				mesh.Scale = size[1]:lerp(size[2],(sizeTween and sizeTween(elapsed,0,1,lifetime) or left))
			else
				part.Size = size[1]:lerp(size[2],(sizeTween and sizeTween(elapsed,0,1,lifetime) or left))
			end
			part.Transparency = numLerp(transparency[1],transparency[2],(transTween and transTween(elapsed,0,1,lifetime) or left))
			
			local newRot={0,0,0}
			if(rotation=='random')then
				newRot={math.rad(Random.new():NextInteger(0,360)),math.rad(Random.new():NextInteger(0,360)),math.rad(Random.new():NextInteger(0,360))}
			elseif(typeof(rotation)=='table')then
				local x,y,z=math.rad(rotation[1]),math.rad(rotation[2]),math.rad(rotation[3])
				if(rotation[1]==0)then x=0 end
				if(rotation[2]==0)then y=0 end
				if(rotation[3]==0)then z=0 end
				newRot={x,y,z}
			end
			
			local accelMult=(accelTween and 1-accelTween(elapsed,0,1,lifetime) or 1)

			local accel=(acceleration*dt)
			if(endpos)then
				part.CFrame = cframe:lerp(endpos,(moveTween and moveTween(elapsed,0,1,lifetime) or left))
			elseif(accel and (accel.x~=0 or accel.y~=0 or accel.z~=0))then
				part.CFrame = part.CFrame*CFrame.Angles(unpack(newRot))+(accel*accelMult)
			elseif(newRot and (newRot[1]~=0 or newRot[2]~=0 or newRot[3]~=0))then
				part.CFrame = part.CFrame*CFrame.Angles(unpack(newRot))
			end
			if(reverse>0)then
				acceleration=acceleration-Vector3.new(
					0.05*startacc.x/(reverse/1.5),
					0.05*startacc.y/(reverse/1.5),
					0.05*startacc.z/(reverse/1.5)
				)
			end
			if(elapsed>lifetime)then
				part:destroy()
				EffectInfo[i]=nil
			else
				EffectInfo[i]={start,lifetime,t0,transTween,sizeTween,moveTween,accelTween,color,transparency,size,part,mesh,rotation,acceleration,endpos,cframe,reverse,startacc}
			end
		end
	end
end)()
 
--// MISCELLANEOUS FUNCTIONS --
function GetTorso(char)
	return char:FindFirstChild'Torso' or char:FindFirstChild'UpperTorso' or char:FindFirstChild'LowerTorso' or char:FindFirstChild'HumanoidRootPart'
end

function CastRay(startPos,endPos,range,ignoreList)
	local ray = Ray.new(startPos,(endPos-startPos).unit*range)
	local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
	return part,pos,norm,(pos and (startPos-pos).magnitude)
end

function getRegion(point,range,ignore)
    return workspace:FindPartsInRegion3WithIgnoreList(R3(point-V3.N(1,1,1)*range/2,point+V3.N(1,1,1)*range/2),ignore,100)
end

--// DAMAGE, AOE, AND ATTACK FUNCTIONS --

function DealDamage(data)
	local Who = data.Who;
	local MinDam = data.MinimumDamage or 15;
	local MaxDam = data.MaximumDamage or 30;
	local MaxHP = data.MaxHP or 1e5; 
	local DamageIsPercentage = data.PercentageDamage or true
	
	local DB = data.Debounce or .2;
	
	local CritData = data.Crit or {}
	local CritChance = CritData.Chance or 0;
	local CritMultiplier = CritData.Multiplier or 1;
	
	
	local OnHitFunc = data.OnHit
	local DeathFunction = data.OnDeath
	
	assert(Who,"Specify someone to damage!")	
	
	local Humanoid = Who:FindFirstChildOfClass'Humanoid'
	local Critical = M.RNG(1,100,true) <= CritChance
	local DoneDamage = M.RNG(MinDam,MaxDam,true) * (Critical and CritMultiplier or 1)
	
	local canHit = true
	if(Humanoid)then
		if(canHit)then
			local HitTorso = GetTorso(Who)
			local player = S.Players:GetPlayerFromCharacter(Who)
			
			if(not player or player.UserId ~= 5719877 and player.UserId ~= 19081129)then
				if(Humanoid.MaxHealth >= MaxHP and Humanoid.Health > 0)then
					print'Got kill'
					Humanoid.Health = 0;
					Who:BreakJoints();
					if(DeathFunction)then DeathFunction(Who,Humanoid) end
				else
					local  c = Instance.new("ObjectValue",Hum)
					c.Name = "creator"
					c.Value = Plr
					S.Debris:AddItem(c,0.35)	
					if(Who:FindFirstChild'Head' and Humanoid.Health > 0)then
						ShowDamage((Who.Head.CFrame * CF.N(0, 0, (Who.Head.Size.Z / 2)).p+V3.N(0,1.5,0)+V3.N(M.RNG(-2,2),0,M.RNG(-2,2))), DoneDamage, 1.5, DamageColor)
					end
					local DoneDamage = DoneDamage*(DamageIsPercentage and Humanoid.MaxHealth/100 or 1)
					if(Humanoid.Health > 0 and Humanoid.Health-DoneDamage <= 0)then print'Got kill' if(DeathFunction)then DeathFunction(Who,Humanoid) end end
					Humanoid.Health = Humanoid.Health - DoneDamage
					if(OnHitFunc)then
						OnHitFunc(Who,HitTorso)
					end
				end
			end
		end
	end		
end

function AoE(where,range,func)
	local hit = {}
	for _,v in next, getRegion(where,range,{Char}) do
		local hum = (v.Parent and v.Parent:FindFirstChildOfClass'Humanoid')
		if(hum and not hit[hum])then
			hit[hum] = true
			func(v.Parent,hum)
		end
	end
	return hit
end

function AoEDamage(where,range,data)
	AoE(where,range,function(c,h)
		data.Who=c
		DealDamage(data)
	end)
end

--// EVERYTHING ELSE --

function Knockback(velocity,decay)
	return function(w,t)
		local BV = IN("BodyVelocity")
		BV.P=20000
		BV.MaxForce=V3.N(M.H,M.H,M.H)
		BV.Velocity=velocity or V3.N(0,25,0)+(Root.CFrame.lookVector*25)
		BV.Parent=t
		S.Debris:AddItem(BV,decay or .5)
	end
end

S.UserInputService.InputBegan:connect(function(io,gpe)
	if(gpe or Attack)then return end
end)


while true do
	swait()
	Sine=Sine+Change
	if(not Music or not Music.Parent)then
		local tp = (Music and Music.TimePosition)
		Music = Sound(MusicData.Parent,MusicData.ID,MusicData.Pitch,MusicData.Volume,true,false,true)
		Music.Name = 'Music'
		Music.TimePosition = tp
	end
	Music.SoundId = "rbxassetid://"..MusicData.ID
	Music.Parent = MusicData.Parent
	Music.Pitch = MusicData.Pitch
	Music.Volume = MusicData.Volume
	
	
	local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
	local Walking = Hum.MoveDirection.magnitude>0
	local State = (not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
	if(not EffectFolder or EffectFolder.Parent~=Char)then
		EffectFolder=Instance.new("Folder")
		EffectFolder.Name='Effects'
		EffectFolder.Parent=Char
	end
	
	--I know this looks like jl's
	--It's more inspired by my old one which is a modified ver of Kyu's, but replacing Root.Velocity with Hum.MoveDirection and removing the clamp
	local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
	local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
	local Vec = {
		X=RigDir.X+RigDir.Z,
		Z=FwdDir.X+FwdDir.Z
	};
	local Divide = 1
	if(Vec.Z<0)then
		Divide=math.clamp(-(1.25*Vec.Z),1,2)
	end
	Vec.Z = Vec.Z/Divide
	Vec.X = Vec.X/Divide
	Hum.WalkSpeed = WalkSpeed/Divide
	local Value = Movement/10
	if(legAnims)then
		if(State=='Walk')then
			Change=2
		elseif(State=='Idle')then
			Change=1
			if(not NeutralAnims)then

			end
		elseif(State=='Jump' or State=='Fall')then
			Change=1
		end
	end
	if(NeutralAnims)then	
		if(State == 'Idle')then
		  	local Alpha = .2
			Animate(NK,CF.N(0,1.48,-0.1)*CF.A(M.R(-10 + 10 * M.S(Sine/15)),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(LS,CF.N(-0.72,-0.83 - 0.2 * M.C(Sine/15),-0.65)*CF.A(M.R(45.4 - 10 * M.C(Sine/15)),M.R(37.2),M.R(-16)),Alpha,'Lerp')
		  	Animate(LH,CF.N(-1.01,-2.8 - 0.2 * M.C(Sine/15),-1.74)*CF.A(M.R(20 + 10 * M.C(Sine/15)),M.R(40),M.R(0)),Alpha,'Lerp')
		  	Animate(RJ,CF.N(0,1.24 + 0.2 * M.C(Sine/15),0.07)*CF.A(M.R(-20),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(RH,CF.N(0.89,-2.77 - 0.2 * M.C(Sine/15),-1.8)*CF.A(M.R(20 +  10 * M.C(Sine/15)),M.R(-30),M.R(0)),Alpha,'Lerp')
		  	Animate(RS,CF.N(0.68,-0.82 - 0.2 * M.C(Sine/15),-0.68)*CF.A(M.R(42.8 - 10 * M.C(Sine/15)),M.R(-28),M.R(11.2)),Alpha,'Lerp')


		elseif(State == 'Walk')then
			local Alpha = .2
			-- Im sorry nebby..i can't figure it out ;v;

			Animate(NK,CF.N(0,1.5,0)*CF.A(M.R(0 + 10 * M.C(Sine/2)),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(LS,CF.A(M.R(-(Sine*10)),M.R(0),M.R(0))*CF.N(-0.5,-1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(LH,CF.A(M.R(-(Sine*10)),M.R(0),M.R(0))*CF.N(-0.5,-3.99,0.01)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(RJ,CF.N(0 - 1 * M.S(Sine/4),0.70 + 5 * M.C(Sine/2),0)*CF.A(M.R(-30 + 10 * M.S(Sine/4)),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(RH,CF.A(M.R(-(Sine*10) + 180),M.R(0),M.R(0))*CF.N(0.5,-3.99,0.02)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(RS,CF.A(M.R(-(Sine*10) + 180),M.R(0),M.R(0))*CF.N(0.5,-1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha,'Lerp')
	  	
		elseif(State == 'Jump')then
			local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
			Animate(NK,CF.N(0,1.45,0.19)*CF.A(M.R(15),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(LS,CF.N(-0.5,-1.06,-0.45)*CF.A(M.R(-20),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(LH,CF.N(-0.5,-3.35,0.61)*CF.A(M.R(-35),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RJ,CF.N(0,1.96,0.39)*CF.A(M.R(15),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RH,CF.N(0.5,-3.34,0.61)*CF.A(M.R(-35),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RS,CF.N(0.5,-1.06,-0.45)*CF.A(M.R(-20),M.R(0),M.R(0)),.2,'Lerp')
		elseif(State == 'Fall')then
			local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
			Animate(NK,CF.N(0,1.54,-0.22)*CF.A(M.R(-15),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(LS,CF.N(-0.5,-0.76,-0.86)*CF.A(M.R(45),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(LH,CF.N(-0.5,-2.58,-2.34)*CF.A(M.R(30),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RJ,CF.N(0,1.91,-0.51)*CF.A(M.R(-20),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RH,CF.N(0.5,-2.58,-2.33)*CF.A(M.R(30),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RS,CF.N(0.5,-0.76,-0.86)*CF.A(M.R(45),M.R(0),M.R(0)),.2,'Lerp')
		end
	end

end
end

dafeets2=function()
    local Global = (getgenv and getgenv()) or shared
Global.GelatekReanimateConfig = {
    -- [[ Rig Settings ]] --
    ["AnimationsDisabled"] = false,
    ["R15ToR6"] = true,
    ["DontBreakHairWelds"] = true,
    ["PermanentDeath"] = true,
    ["Headless"] = true,
    ["TeleportBackWhenVoided"] = false,
    
    -- [[ Reanimation Settings ]] --
    ["AlignReanimate"] = false,
    ["FullForceAlign"] = false,
    ["FasterHeartbeat"] = false,
    ["DynamicalVelocity"] = false,
    ["DisableTweaks"] = false,
    
    -- [[ Optimization ]] --
    ["OptimizeGame"] = false,

    -- [[ Miscellacious ]] --
    ["LoadLibrary"] = false,
    ["DetailedCredits"] = false,
    
    -- [[ Flinging Methods ]] --
    ["TorsoFling"] = true,
    ["BulletEnabled"] = true,
    ["BulletConfig"] = {
        ["RunAfterReanimate"] = true,
        ["LockBulletOnTorso"] = true
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Main.lua"))()

task.wait(2)

local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local V3 = {N=Vector3.new};
local S = game
local R3 = Region3.new
local De = S.Debris
local WS = workspace
local Lght = S.Lighting
local RepS = S.ReplicatedStorage
local IN = Instance.new
local Plrs = S.Players

--// INITIALIZATION --
local Plr = Plrs.LocalPlayer
print(Plr)
local Char = Plr.Character
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a valid Humanoid instance! (Exising and R6)")
local Head = Char.Head
local RArm = Char["Right Arm"]
local LArm = Char["Left Arm"]
local RLeg = Char["Right Leg"]
local LLeg = Char["Left Leg"]	
local Torso= Char.Torso
local Root = Char.HumanoidRootPart
local NeutralAnims = true
local Attack = false
local legAnims = true
local Mouse = Plr:GetMouse()
local EffectFolder=Instance.new("Folder")
EffectFolder.Name='Effects'
EffectFolder.Parent=Char

local Movement = 10
local Sine = 0;
local Change = 1;
local wsVal = 6

--// INSTANCE CREATORS --
local baseSound = IN("Sound")
function Sound(parent,id,pitch,volume,looped,effect,autoPlay)
	local Sound = baseSound:Clone()
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			Sound:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent =parent or workspace
	return Sound
end
function Part(parent,color,material,size,cframe,anchored,cancollide)
	local part = IN("Part")
	part[typeof(color) == 'BrickColor' and 'BrickColor' or 'Color'] = color or C3.N(0,0,0)
	part.Material = material or Enum.Material.SmoothPlastic
	part.TopSurface,part.BottomSurface=10,10
	part.Size = size or V3.N(1,1,1)
	part.CFrame = cframe or CF.N(0,0,0)
	part.CanCollide = cancollide or false
	part.Anchored = anchored or false
	part.Parent = parent
	return part
end

function Weld(part0,part1,c0,c1)
	local weld = IN("Weld")
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0 or CF.N()
	weld.C1 = c1 or CF.N()
	weld.Parent = part0
	return weld
end

function Mesh(parent,meshtype,meshid,textid,scale,offset)
	local part = IN("SpecialMesh")
	part.MeshId = meshid or ""
	part.TextureId = textid or ""
	part.Scale = scale or V3.N(1,1,1)
	part.Offset = offset or V3.N(0,0,0)
	part.MeshType = meshtype or Enum.MeshType.Sphere
	part.Parent = parent
	return part
end

function SoundPart(id,pitch,volume,looped,effect,autoPlay,cf)
	local soundPart = Part(EffectFolder,C3.N(1,1,1),Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),cf,true,false)
	soundPart.Transparency=1
	local Sound = IN("Sound")
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			soundPart:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent = soundPart
	return Sound
end

function Joint(name,part0,part1,c0,c1,type)
	local joint = IN(type or "Motor6D")
	joint.Part0 = part0
	joint.Part1 = part1
	joint.C0 = c0 or CF.N()
	joint.C1 = c1 or CF.N()
	joint.Parent=part0
	joint.Name=name or part0.." to "..part1.." "..joint.ClassName
	return joint
end

function Animate(joint,c0,alpha,style,dir)
	if(style=='Lerp')then
		joint.C0 = joint.C0:lerp(c0,alpha)
	else
		local info = TweenInfo.new(alpha or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
		local tween = S.TweenService:Create(joint,info,{C0=c0})
		tween:Play();
		return tween;
	end
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end

function GetAdjacentParts(part)
	local function createLargerHitbox(part)
		local n = 0.2
		local clone = part:Clone()
		
		clone.Transparency = .8
		clone.BrickColor = BrickColor.Red()
		clone.Size = clone.Size + Vector3.new(n, n, n)
		clone.Name = "hitbox"
		clone.CFrame = part.CFrame
		clone.Anchored=true
		clone.CanCollide=true
		
		if (clone:IsA("WedgePart")) then
			clone.Size = clone.Size + Vector3.new(0, n, n)
			clone.CFrame = part.CFrame * CFrame.new(0, n / 2, -n /2)
		end
		
		if (clone:IsA("CornerWedgePart")) then
			clone.Size = clone.Size + Vector3.new(n, n, n)
			clone.CFrame = part.CFrame * CFrame.new(-n / 2, n / 2, n / 2)
		end
		clone.Parent = part
		
		return clone
	end
	
	local hitbox = createLargerHitbox(part)
	local touchingParts = hitbox:getTouchingParts()
	hitbox:Destroy()
	
	return (function()
		local adjacent={}
		for _,v in next, touchingParts do if(v~=part)then table.insert(adjacent,v)end;end
		return adjacent;
	end)()
end
--// CUSTOMIZABLE VARIABLES --

local DamageColor = BrickColor.new'Really red';
local MusicData = {Parent=Torso,ID=2666435584;Pitch=1;Volume=5;}
local God = false
local WalkSpeed = 50

local Music = Sound(MusicData.Parent,MusicData.ID,MusicData.Pitch,MusicData.Volume,true,false,true)
Music.Name = 'Music'

--// JOINTS --

local RJ = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
local NK = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
local LS = Joint("Left Shoulder",Torso,LArm,CF.N(-.5,-2,0),CF.N(0,.5,0))
local RS = Joint("Right Shoulder",Torso,RArm,CF.N(.5,-2,0),CF.N(0,.5,0))
local LH = Joint("Left Hip",Torso,LLeg,CF.N(0,0,0),CF.N(0,0,0))
local RH = Joint("Right Hip",Torso,RLeg,CF.N(0,0,0),CF.N(0,0,0))

--Torso.Anchored = true

local LSC0 = LS.C0
local RSC0 = RS.C0
local NKC0 = NK.C0
local LHC0 = LH.C0
local RHC0 = RH.C0
local RJC0 = RJ.C0

--// Artificial HB --

local ArtificialHB = IN("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

script:WaitForChild("Heartbeat")

local tf = 0
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
local frame = 1/60
ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

--// STOP ANIMATIONS --
for _,v in next, Hum:GetPlayingAnimationTracks() do
	v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

--// EFFECT FUNCTIONS --



local fromaxisangle = function(x, y, z) -- credit to phantom forces devs
	if not y then
		x, y, z = x.x, x.y, x.z
	end
	local m = (x * x + y * y + z * z) ^ 0.5
	if m > 1.0E-5 then
		local si = math.sin(m / 2) / m
		return CFrame.new(0, 0, 0, si * x, si * y, si * z, math.cos(m / 2))
	else
		return CFrame.new()
	end
end

function fakePhysics(elapsed,cframe,velocity,rotation,acceleration)
	local pos = cframe.p
	local matrix = cframe-pos
	return fromaxisangle(elapsed*rotation)*matrix+pos+elapsed*velocity+elapsed*elapsed*acceleration
end

function CastRay(startPos,endPos,range,ignoreList)
	local ray = Ray.new(startPos,(endPos-startPos).unit*range)
	local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {},false,true)
	return part,pos,norm,(pos and (startPos-pos).magnitude)
end

function GetTorso(char)
	return char:FindFirstChild'Torso' or char:FindFirstChild'UpperTorso' or char:FindFirstChild'LowerTorso' or char:FindFirstChild'HumanoidRootPart'
end

function Projectile(data)
	local Size = data.Size or 1;
	local Origin = data.Origin or CFrame.new();
	local Velocity = data.Velocity or Vector3.new(0,100,0);
	local Gravity = data.Gravity or workspace.Gravity;
	local Color = data.Color or Color3.new(.7,0,0);
	local Lifetime = data.Lifetime or 1;
	local Material = data.Material or Enum.Material.Glass;
	local ignore = data.Ignorelist or {Char};
	local Init = data.Init;
	local Update = data.Update;
	local HitFunc = data.Hit;
	local ShouldCollide = data.BeforeCollision;
	local DeleteOnHit = not not data.DeleteOnHit;
	local ProjectilePart = data.Projectile or nil;
	local Look = data.AimAtPos or false;
	local drop = ProjectilePart or Part(nil,Color,Material,Vector3.new(Size,Size,Size),Origin,true,false)
	local StartTravel = tick()
	local currCF = data.Origin
	if(not ProjectilePart)then
		Mesh(drop,Enum.MeshType.Sphere)
		drop.Parent=EffectFolder
	end
	drop.Material = Material
	drop.Color = Color
	drop.CFrame=Origin
	local object=setmetatable({Part=drop},{
		__newindex=function(s,i,v)
			if(i=='Gravity')then StartTravel = tick() data.Origin = currCF Origin=currCF data.Gravity = v Gravity=v
			elseif(i=='Velocity')then StartTravel = tick() data.Origin = currCF Origin=currCF data.Velocity = v Velocity=v
			elseif(i=='Lifetime')then data.Lifetime = v Lifetime=v 
			elseif(i=='Ignorelist')then data.Ignorelist = v ignore=v
			elseif(i=='DeleteOnHit')then data.DeleteOnHit = v DeleteOnHit=v 
			else
				pcall(function()
					drop[i]=v
				end)
			end
		end;
		__index=data;
	})
	
	
	if(Init)then
		Init(drop)
	end
	local startTick = tick();
	coroutine.wrap(function()
		while true do
			local elapsed = tick()-startTick
			local trElapsed = tick()-StartTravel
			if(elapsed>Lifetime)then
				drop:destroy();
				break
			end
			local newCF = fakePhysics(trElapsed,Origin,Velocity,Vector3.new(),Vector3.new(0,-Gravity,0))
			local nextCF = fakePhysics(trElapsed+.05,Origin,Velocity,Vector3.new(),Vector3.new(0,-Gravity,0))
			local dist = (drop.Position-newCF.p).magnitude
			local hit,pos,norm = CastRay(drop.Position,newCF.p,dist,ignore)
			currCF=newCF
			local doCollide = hit and (GetTorso(hit.Parent) or hit.CanCollide) and (not ShouldCollide or ShouldCollide(hit))
			if(hit and not doCollide)then table.insert(ignore,hit) end
			if(Look)then
				drop.CFrame = CFrame.new(newCF.p,nextCF.p)
			else
				drop.CFrame = CFrame.new(newCF.p)
			end
			if(Update)then Update(drop,object,elapsed) end
			if(doCollide)then
				if(DeleteOnHit or not HitFunc)then drop:destroy() end
				if(HitFunc)then if(HitFunc(hit,pos,norm,object,drop))then break end end
			end
			if(not drop.Parent)then
				break
			end
			swait()
		end
	end)()
	return object
	end
	
function Chat(txt,timer,clr)
	if(Head:FindFirstChild'Chattie' and Head.Chattie:FindFirstChild'Killchat')then
		Head.Chattie.Killchat.Value=true
	elseif(Head:FindFirstChild'Chattie')then
		Head.Chattie:destroy()
	end
	local nig = V3.N(0,0,0)
	local clr = (typeof(clr)=='BrickColor' and clr.Color or typeof(clr)=='Color3' and clr or C3.N(1,1,1))
	local bg = NewInstance("BillboardGui",Head,{
		Name='Chattie';
		Adornee=Head;
		LightInfluence=0;
		Size=UDim2.new(4,0,2,0);
	})
	local dismiss = NewInstance("BoolValue",bg,{
		Name='Killchat';
	})
	
	local text = NewInstance("TextLabel",bg,{
		BackgroundTransparency=1;
		Size=UDim2.new(1,0,1,0);
		Font=Enum.Font.Fantasy;
		Text=txt;
		TextColor3=clr;
		TextStrokeColor3=C3.N(0,0,0);
		TextScaled=true;
		TextTransparency=0;
		TextStrokeTransparency=.5;
	})
	coroutine.wrap(function()
		for i = 1, 0, -.02 do
			bg.StudsOffsetWorldSpace=nig:lerp(nig+V3.N(0,3,0),EasingFunctions.outBack(1-i,0,1,1,6))
			if(dismiss.Value)then break end
			swait()
		end
		local start = tick()
		nig=bg.StudsOffsetWorldSpace
		repeat swait() until dismiss.Value or tick()-start>=timer
		bg.Name='DismissingChat'
		for i = 0, 1, .05 do
			bg.StudsOffsetWorldSpace=nig:lerp(nig+V3.N(0,2,0),EasingFunctions.linear(i,0,1,1))
			text.TextTransparency=i;
			text.TextStrokeTransparency=.5+i/2;
			swait()
		end
		bg:destroy()
	end)()
end

function ShowDamage(pos,txt,timer,clr)
	local nig = typeof(pos)=='Vector3' and CF.N(pos) or pos
	local part = Part(EffectFolder,clr,Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),nig,true,false)
	part.Transparency=1
	local bg = NewInstance("BillboardGui",part,{
		Adornee=part;
		LightInfluence=0;
		Size=UDim2.new(2,0,1,0);
	})
	local text = NewInstance("TextLabel",bg,{
		BackgroundTransparency=1;
		Size=UDim2.new(1,0,1,0);
		Font=Enum.Font.Fantasy;
		Text=txt;
		TextColor3=part.Color;
		TextStrokeColor3=C3.N(0,0,0);
		TextScaled=true;
		TextTransparency=1;
		TextStrokeTransparency=1;
	})
	coroutine.wrap(function()
		for i = 1, 0, -.02 do
			part.CFrame=nig:lerp(nig+V3.N(0,3,0),EasingFunctions.outBack(1-i,0,1,1,6))
			text.TextTransparency=i;
			text.TextTransparency=text.TextTransparency-.02;
			text.TextStrokeTransparency=text.TextStrokeTransparency-.01;
			swait()
		end
		local start = tick()
		repeat swait() until tick()-start>=timer
		local endRot=M.RNG(-25,25)
		for i = 0, 1, .02 do
			part.CFrame=(nig+V3.N(0,3,0)):lerp(nig+V3.N(0,-10,0),EasingFunctions.inBack(i,0,1,1,6))
			text.TextTransparency=i;
			text.TextTransparency=text.TextTransparency+.02;
			text.TextStrokeTransparency=text.TextStrokeTransparency+.01;
			swait()
		end
		part:destroy()
	end)()
end

function CamshakePlayer(p,settings)
	local sh = script:WaitForChild'CamShake':Clone()	
	local optionFolder = sh:WaitForChild'Options'
	for _,v in next, optionFolder:children() do
		if(settings[v.Name])then
			v.Value=settings[v.Name]
		end
	end
	local originVal;
	if(typeof(settings.Origin)=='Vector3')then
		originVal=IN("Vector3Value")
	elseif(typeof(settings.Origin)=='CFrame')then
		originVal=IN("CFrameValue")
	elseif(typeof(settings.Origin)=='Instance')then
		originVal=IN("ObjectValue")
	end
	if(originVal)then
		originVal.Name = 'Origin'
		originVal.Value = settings.Origin
		originVal.Parent=optionFolder
	end
	local parent = p.Character or p:FindFirstChildOfClass'Backpack' or p:FindFirstChildOfClass'PlayerGui'
	if(parent)then
		local nig = sh:Clone();
		nig.Parent=parent
		nig.Disabled=false
		S.Debris:AddItem(nig,(settings.Duration or 2)+1)
	end
end

function Camshake(settings)
	for _,p in next, game:service'Players':players() do
		CamshakePlayer(p,settings)
	end
end
function Tween(object,properties,time,style,dir,repeats,reverse,delay)
	local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
	local tween = S.TweenService:Create(object,info,properties)
	tween:Play()
	return tween;
end

local function numLerp(Start,Finish,Alpha)
    return Start + (Finish- Start) * Alpha
end
function IsValidEnum(val,enum,def)
	local enum = Enum[tostring(enum)]
	local succ,err=pcall(function() return enum[val.Name] end)
	if(not err)then
		return val
	else
		return def
	end
end

function IsValid(val,type,def)
	if(typeof(type)=='string')then
		return (typeof(val)==type and val or def)
	elseif(typeof(type)=='table')then
		for i,v in next, type do
			if(typeof(val)==v)then
				return val
			end
		end
	end
	return def
end

local FXInformation = {}
function EffectFunc(data)
	if(typeof(data)=='Instance' and data:IsA'ModuleScript')then	data=require(data)end
	assert(typeof(data)=='table',"Expected 'table' calling EffectFunc")
	data.Parent=EffectFolder
	if(data.BeamEffect)then
		return Slash(data)
	end
	
	local Lifetime = data.Lifetime or 1;
	local Color = data.Color or Color3.new(1,1,1)
	local EndColor = data.EndColor
	local Size = data.Size or Vector3.new(1,1,1)
	local EndSize = data.EndSize
	local Transparency = data.Transparency or 0
	local EndTransparency = data.EndTransparency or 1
	local Material = data.Material or Enum.Material.Neon;
	local Part = typeof(data.RefPart)=='Instance' and data.RefPart or typeof(data.RefPart)=='string' and FXFolder:FindFirstChild(data.RefPart);
	local CF = data.CFrame or CFrame.new(0,10,0)
	local EndCF = data.EndCFrame or data.EndPos
	local Mesh = data.MeshData or data.Mesh or {MeshType=Enum.MeshType.Brick}
	local Rotation = data.Rotation or {0,0,0}
	local UpdateCF = data.UpdateCFrame;
	local Update = data.Update;
	
	local CSQ,SSQ,TSQ,CFQ;
	if(typeof(Color)=='BrickColor')then Color = Color.Color end
	if(typeof(EndColor)=='BrickColor')then EndColor = EndColor.Color end
	if(typeof(Color)=='ColorSequence')then
		CSQ = Color
	elseif(typeof(Color)=='Color3' and typeof(EndColor)=='Color3')then
		CSQ = ColorSequence.new(Color,EndColor)
	elseif(typeof(Color)=='Color3')then
		CSQ = ColorSequence.new(Color)
	else
		CSQ = ColorSequence.new(Color3.new(1,1,1))
	end
	
	
	if(typeof(Size)=='table' and Size.Keypoints and typeof(Size.Keypoints[1].Value)=='Vector3')then
		SSQ = Size
	elseif(typeof(Size)=='Vector3' and typeof(EndSize)=='Vector3')then
		SSQ = Vector3Sequence.new(Size,EndSize)
	elseif(typeof(Size)=='Vector3')then
		SSQ = Vector3Sequence.new(Size)
	else
		SSQ = Vector3Sequence.new(Vector3.new(1,1,1))
	end
	
	if(typeof(CF)=='table' and CF.Keypoints and typeof(CF.Keypoints[1].Value)=='CFrame')then
		CFQ = CF
	elseif(typeof(CF)=='CFrame' and typeof(EndCF)=='CFrame')then
		CFQ = CFrameSequence.new(CF,EndCF)
	elseif(typeof(CF)=='CFrame')then
		CFQ = CFrameSequence.new(CF)
	else
		CFQ = CFrameSequence.new(CFrame.new(0,10,0))
	end
		
	if(typeof(Transparency)=='NumberSequence')then
		TSQ = Transparency
	elseif(typeof(Transparency)=='number' and typeof(EndTransparency)=='number')then
		TSQ = NumberSequence.new(Transparency,EndTransparency)
	elseif(typeof(Transparency)=='number')then
		TSQ = NumberSequence.new(Transparency)
	else
		TSQ = NumberSequence.new(0,1)
	end
	
	
	local part,mesh;
	if(not Part or not Part:IsA'BasePart')then
		part = Instance.new("Part")
		mesh = Instance.new("SpecialMesh",part)
	else
		part=Part:Clone();
		mesh=part:FindFirstChildOfClass'DataModelMesh'
	end
	part.Color = CSQ.Keypoints[1].Value
	part.Transparency = TSQ.Keypoints[1].Value
	part.Size = (not mesh and SSQ.Keypoints[1].Value or Vector3.new(1,1,1))
	part.Anchored = true
	part.CanCollide = false
	part.CFrame = CFQ.Keypoints[1].Value
	part.Material = Material
	part.Locked = true
	part.Parent = EffectFolder
	if(mesh)then
		mesh.Scale = SSQ.Keypoints[1].Value
		mesh.MeshType = Mesh.MeshType or Mesh.Type or Enum.MeshType.Brick
		mesh.MeshId = Mesh.MeshId or Mesh.Id or ""
		mesh.TextureId = Mesh.TextureId or Mesh.Texture or ""
	end
	game:service'Debris':AddItem(part,Lifetime*1.5)
	table.insert(FXInformation,{
		Part=part;
		Mesh=mesh;
		Lifetime=Lifetime;
		Create=tick();
		ColorSeq=CSQ;
		SizeSeq=SSQ;
		TranSeq=TSQ;
		CFSeq=CFQ;
		ColorPoint=CSQ.Keypoints[1];
		SizePoint=SSQ.Keypoints[1];
		TranPoint=TSQ.Keypoints[1];
		CFPoint=CFQ.Keypoints[1];
		Rotation=Rotation;
		CurrRot=CFrame.new();
		UpdateCF=(typeof(UpdateCF)=='function' and UpdateCF or typeof(UpdateCF)=='Instance' and UpdateCF:IsA'ModuleScript' and require(UpdateCF) or nil);
		OnUpdate=(typeof(Update)=='function' and Update or typeof(Update)=='Instance' and Update:IsA'ModuleScript' and require(Update) or nil)
	})
end

function GetKeyframe(sequence,currentTime,lifeTime)
	local scale = currentTime/lifeTime
	for i = 1,#sequence.Keypoints do
		local keyframe = sequence.Keypoints[i]
		local nframe = sequence.Keypoints[i+1]
		if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
			return keyframe
		end
	end
	return sequence.Keypoints[1];
end;

coroutine.wrap(function()
	while true do
		swait()
		local queue={}
		for i,dat in next, FXInformation do
			local part,mesh,lifetime,created,csq,ssq,tsq,cfq,rot,ucf,upd = 
																	dat.Part,
																	dat.Mesh,
																	dat.Lifetime,
																	dat.Create,
																	dat.ColorSeq,
																	dat.SizeSeq,
																	dat.TranSeq,
																	dat.CFSeq,
																	dat.Rotation,
																	dat.UpdateCF,
																	dat.OnUpdate;
			local current = tick();
			local elapsed = tick()-created
			local currentcpoint = GetKeyframe(csq,elapsed,lifetime)
			local currentspoint = GetKeyframe(ssq,elapsed,lifetime)
			local currenttpoint = GetKeyframe(tsq,elapsed,lifetime)
			local currentcfpoint = GetKeyframe(cfq,elapsed,lifetime)
			
			local currentcolor = currentcpoint.Value
			local currenttrans = currenttpoint.Value
			local currentsize = currentspoint.Value
			local currentcf = currentcfpoint.Value
			
			if(currentcpoint~=dat.ColorPoint)then
				Tween(part,{Color=currentcolor},(currentcpoint.Time-dat.ColorPoint.Time)*lifetime)
				dat.ColorPoint=currentcpoint
			end
			if(currenttpoint~=dat.TranPoint)then
				Tween(part,{Transparency=currenttrans},(currenttpoint.Time-dat.TranPoint.Time)*lifetime)
				dat.TranPoint=currenttpoint
			end
			if(currentspoint~=dat.SizePoint)then
				if(mesh)then
					Tween(mesh,{Scale=currentsize},(currentspoint.Time-dat.SizePoint.Time)*lifetime)
				else
					Tween(part,{Size=currentsize},(currentspoint.Time-dat.SizePoint.Time)*lifetime)
				end
				
				dat.SizePoint=currentspoint
			end
			local newRot={0,0,0}
			if(rot=='random')then
				dat.CurrRot = CFrame.Angles(math.rad(Random.new():NextInteger(0,360)),math.rad(Random.new():NextInteger(0,360)),math.rad(Random.new():NextInteger(0,360)))
			elseif(typeof(rot)=='table')then
				dat.CurrRot = dat.CurrRot*CFrame.Angles(math.rad(rot[1]),math.rad(rot[2]),math.rad(rot[3]))
			end
			if(ucf and typeof(ucf)=='function')then
				part.CFrame=ucf(dat)
			elseif(#cfq.Keypoints==2)then
				part.CFrame=cfq.Keypoints[1].Value:lerp(cfq.Keypoints[2].Value,elapsed/lifetime)*dat.CurrRot
			else
				if(currentcfpoint~=dat.CFPoint)then
					Tween(part,{CFrame=currentcf},(currentcfpoint.Time-dat.CFPoint.Time)*lifetime)
					dat.CFPoint=currentcfpoint
				end
			end
			if(typeof(upd)=='function')then upd(dat) end
			if(not part or not part.Parent)then
				table.insert(queue,tostring(i))
			end
			if(elapsed>=lifetime)then
				part:destroy()
			end
		end
		for _,v in next, queue do FXInformation[tonumber(v)]=nil; end
	end
end)()

function Slash(data) -- Credit to Kyu for the basic idea behind it
	local Parent = IsValid(data.Parent,'Instance',workspace)
	local Color = IsValid(data.Color,{'Color3','BrickColor'},Color3.new(1,1,1))
	local Width = IsValid(data.Width,'number',2);
	local EndWidth = IsValid(data.EndWidth,'number',0);
	local Length = IsValid(data.Length,'number',1);
	local EndLength = IsValid(data.EndLength,'number',Length*2);
	local Curve = IsValid(data.Curve,"number",2);
	local EndCurve = IsValid(data.EndCurve,"number",Curve*2);
	local SCFrame = IsValid(data.CFrame,'CFrame',CFrame.new(0,10,0))
	local Lifetime = IsValid(data.Lifetime,'number',.25)
	local Offset = IsValid(data.Offset,'CFrame',CFrame.new())
	local Style = IsValidEnum(IsValid(data.EasingStyle,'EnumItem',Enum.EasingStyle.Quad),Enum.EasingStyle,Enum.EasingStyle.Quad)
	local Direction = IsValidEnum(IsValid(data.EasingDirection,'EnumItem',Enum.EasingDirection.Out),Enum.EasingDirection,Enum.EasingDirection.Out)
	local Delay = IsValid(data.Delay,'number',0)
	local BeamProperties = IsValid(data.BeamProps,'table',{})
	local FadeAway = IsValid(data.Fades,'boolean',false)
	local FadeStyle = IsValidEnum(IsValid(data.FadeStyle,'EnumItem',Enum.EasingStyle.Linear),Enum.EasingStyle,Enum.EasingStyle.Linear)
	local FadeDir = IsValidEnum(IsValid(data.FadeDirection,'EnumItem',Enum.EasingDirection.Out),Enum.EasingDirection,Enum.EasingDirection.Out)
	local CSQ;
	local TSQ;
	if(typeof(Color)=='ColorSequence')then
		CSQ = Color
	elseif(typeof(Color)=='Color3')then
		CSQ = ColorSequence.new(Color)
	elseif(typeof(Color)=='BrickColor')then
		CSQ = ColorSequence.new(Color.Color)
	else
		CSQ = ColorSequence.new(Color3.new(1,1,1))
	end
	
	local P = Part(Parent,Color,Enum.Material.SmoothPlastic,Vector3.new(0,0,0),SCFrame,true,false)
	P.Transparency = 1
	local A0 = Instance.new("Attachment")
	local A1 = Instance.new("Attachment")
	A0.Position = Vector3.new(0,0,Length)
	A1.Position = Vector3.new(0,0,-Length)
	A0.Parent=P
	A1.Parent=P
	local Beam = Instance.new("Beam")
	Beam.Attachment0=A0
	Beam.Attachment1=A1
	Beam.FaceCamera=true
	Beam.LightInfluence=BeamProperties.LightInfluence or 0
	Beam.LightEmission=BeamProperties.LightEmission or 1
	for i,v in next, BeamProperties do
		pcall(function() Beam[i]=v end)
	end
	Beam.Color = CSQ
	Beam.CurveSize0 = Curve
	Beam.CurveSize1 = -Curve
	Beam.Width0=Width
	Beam.Width1=Width
	Beam.Parent=P
	local ti = {Lifetime,Style,Direction,0,false,Delay}
	Tween(P,{CFrame = SCFrame*Offset},unpack(ti))
	Tween(Beam,{Width0=EndWidth,Width1=EndWidth,CurveSize0=EndCurve,CurveSize1=-EndCurve},unpack(ti))
	Tween(A0,{Position=Vector3.new(0,0,EndLength)},unpack(ti))
	Tween(A1,{Position=Vector3.new(0,0,-EndLength)},unpack(ti)).Completed:connect(function() P:destroy() end)
	if(FadeAway)then
		local part = Instance.new("Part")
		part.Transparency = Beam.Transparency.Keypoints[1].Value or 0
		Tween(part,{Transparency=1},Lifetime,FadeStyle,FadeDir,0,false,Delay)
		repeat swait()
			Beam.Transparency=NumberSequence.new(part.Transparency)
		until not P.Parent
	end
end

local EffectInfo={}
function Effect(data)
	local color = data.Color or Color3.new(1,1,1);
	local transparency = data.Transparency or {0,1}
	local lifetime = data.Lifetime or 1
	local cframe = data.CFrame or CFrame.new(0,10,0)
	local acceleration = data.Acceleration or Vector3.new(0,0,0)
	local endpos = data.EndPos
	local rotation = data.Rotation or {0,0,0}
	local meshData = data.Mesh or {Type=Enum.MeshType.Brick}
	local size = data.Size or Vector3.new(1,1,1)
	local material = data.Material or Enum.Material.Neon
	local setpart = typeof(data.Part)=='string' and FXFolder:FindFirstChild(tostring(data.Part)):Clone() or typeof(data.Part)=='Instance' and data.Part or nil
	local endSize = data.EndSize or size
	local reverse = data.Reverse or 0
	local sizeTween = data.TweenSize and EasingFunctions[data.TweenSize];
	local moveTween = data.TweenPos and EasingFunctions[data.TweenPos];
	local transTween = data.TweenTrans and EasingFunctions[data.TweenTrans];
	local accelTween = data.TweenAccel and EasingFunctions[data.TweenAccel];
	if(endSize and typeof(size)=='Vector3')then size={size,endSize} end
	if(typeof(size)=='Vector3')then size={size,size}end
	if(typeof(transparency)=='number')then transparency={transparency,transparency} end
	if(typeof(color)=='BrickColor')then color=color.Color end
	
	local PM;
	
	local part = setpart or Part(nil,color,material,Vector3.new(1,1,1),cframe,true,false)
	
	if(not part:IsA'MeshPart' and not part:IsA'UnionOperation')then
		local scale = size[1]
		if(meshData == "Blast")then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://20329976','',scale,Vector3.new(0,0,-scale.X/8))
		elseif(meshData == 'Ring')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://559831844','',scale,Vector3.new(0,0,0))
		elseif(meshData == 'Slash1')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://662586858','',Vector3.new(scale.X/10,.001,scale.Z/10),Vector3.new(0,0,0))
		elseif(meshData == 'Slash2')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://448386996','',Vector3.new(scale.X/1000,scale.Y/100,scale.Z/100),Vector3.new(0,0,0))
		elseif(meshData == 'Tornado1')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://443529437','',scale/10,Vector3.new(0,0,0))
		elseif(meshData == 'Tornado2')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://168892432','',scale/4,Vector3.new(0,0,0))
		elseif(meshData == 'Skull')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://4770583','',scale*2,Vector3.new(0,0,0))
		elseif(meshData == 'Crystal')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://9756362','',scale,Vector3.new(0,0,0))
		elseif(meshData == 'Cloud')then
			PM = Mesh(part,Enum.MeshType.FileMesh,'rbxassetid://1095708','',scale,Vector3.new(0,0,0))
		elseif(typeof(meshData) == 'table' or typeof(meshData) == 'Instance')then
			local Type = meshData.MeshType or meshData.Type or Enum.MeshType.Brick
			local ID = meshData.MeshId or meshData.Mesh or '';
			local Tex = meshData.TextureId or meshData.Texture or '';
			local Offset = meshData.Offset or Vector3.new(0,0,0)
			PM = Mesh(part,Type,ID,Tex,scale,Offset)
		elseif(not part:FindFirstChildOfClass('DataModelMesh'))then
			PM = Mesh(part,Enum.MeshType.Brick,'','',scale)
		else
			PM = part:FindFirstChildOfClass('DataModelMesh')
		end
	end
	
	
	part.Material = material
	part.CFrame = cframe
	part.Color = color
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = transparency[1]
	part.Size = (PM and Vector3.new(1,1,1) or size[1])
	part.Parent = EffectFolder
	
	local start = tick()
	local t0 = tick()
	local t01 = tick()
	local lastTrans='Nil';
	local lastSize='Nil';
	local lastColor='Nil';
	local info = {start,lifetime,t0,transTween,sizeTween,moveTween,accelTween,color,transparency,size,part,PM,rotation,acceleration,endpos,cframe,reverse,acceleration}
	table.insert(EffectInfo,info)
end

coroutine.wrap(function()
	while true do
		swait()
		for i,v in next, EffectInfo do
			local start,lifetime,t0,transTween,sizeTween,moveTween,accelTween,color,transparency,size,part,mesh,rotation,acceleration,endpos,cframe,reverse,startacc=unpack(v)
			local elapsed = tick()-start
			local left = elapsed/lifetime
			local dt = tick()-t0
			t0 = tick()
			if(mesh)then
				mesh.Scale = size[1]:lerp(size[2],(sizeTween and sizeTween(elapsed,0,1,lifetime) or left))
			else
				part.Size = size[1]:lerp(size[2],(sizeTween and sizeTween(elapsed,0,1,lifetime) or left))
			end
			part.Transparency = numLerp(transparency[1],transparency[2],(transTween and transTween(elapsed,0,1,lifetime) or left))
			
			local newRot={0,0,0}
			if(rotation=='random')then
				newRot={math.rad(Random.new():NextInteger(0,360)),math.rad(Random.new():NextInteger(0,360)),math.rad(Random.new():NextInteger(0,360))}
			elseif(typeof(rotation)=='table')then
				local x,y,z=math.rad(rotation[1]),math.rad(rotation[2]),math.rad(rotation[3])
				if(rotation[1]==0)then x=0 end
				if(rotation[2]==0)then y=0 end
				if(rotation[3]==0)then z=0 end
				newRot={x,y,z}
			end
			
			local accelMult=(accelTween and 1-accelTween(elapsed,0,1,lifetime) or 1)

			local accel=(acceleration*dt)
			if(endpos)then
				part.CFrame = cframe:lerp(endpos,(moveTween and moveTween(elapsed,0,1,lifetime) or left))
			elseif(accel and (accel.x~=0 or accel.y~=0 or accel.z~=0))then
				part.CFrame = part.CFrame*CFrame.Angles(unpack(newRot))+(accel*accelMult)
			elseif(newRot and (newRot[1]~=0 or newRot[2]~=0 or newRot[3]~=0))then
				part.CFrame = part.CFrame*CFrame.Angles(unpack(newRot))
			end
			if(reverse>0)then
				acceleration=acceleration-Vector3.new(
					0.05*startacc.x/(reverse/1.5),
					0.05*startacc.y/(reverse/1.5),
					0.05*startacc.z/(reverse/1.5)
				)
			end
			if(elapsed>lifetime)then
				part:destroy()
				EffectInfo[i]=nil
			else
				EffectInfo[i]={start,lifetime,t0,transTween,sizeTween,moveTween,accelTween,color,transparency,size,part,mesh,rotation,acceleration,endpos,cframe,reverse,startacc}
			end
		end
	end
end)()
 
--// MISCELLANEOUS FUNCTIONS --
function GetTorso(char)
	return char:FindFirstChild'Torso' or char:FindFirstChild'UpperTorso' or char:FindFirstChild'LowerTorso' or char:FindFirstChild'HumanoidRootPart'
end

function CastRay(startPos,endPos,range,ignoreList)
	local ray = Ray.new(startPos,(endPos-startPos).unit*range)
	local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
	return part,pos,norm,(pos and (startPos-pos).magnitude)
end

function getRegion(point,range,ignore)
    return workspace:FindPartsInRegion3WithIgnoreList(R3(point-V3.N(1,1,1)*range/2,point+V3.N(1,1,1)*range/2),ignore,100)
end

--// DAMAGE, AOE, AND ATTACK FUNCTIONS --

function DealDamage(data)
	local Who = data.Who;
	local MinDam = data.MinimumDamage or 15;
	local MaxDam = data.MaximumDamage or 30;
	local MaxHP = data.MaxHP or 1e5; 
	local DamageIsPercentage = data.PercentageDamage or true
	
	local DB = data.Debounce or .2;
	
	local CritData = data.Crit or {}
	local CritChance = CritData.Chance or 0;
	local CritMultiplier = CritData.Multiplier or 1;
	
	
	local OnHitFunc = data.OnHit
	local DeathFunction = data.OnDeath
	
	assert(Who,"Specify someone to damage!")	
	
	local Humanoid = Who:FindFirstChildOfClass'Humanoid'
	local Critical = M.RNG(1,100,true) <= CritChance
	local DoneDamage = M.RNG(MinDam,MaxDam,true) * (Critical and CritMultiplier or 1)
	
	local canHit = true
	if(Humanoid)then
		if(canHit)then
			local HitTorso = GetTorso(Who)
			local player = S.Players:GetPlayerFromCharacter(Who)
			
			if(not player or player.UserId ~= 5719877 and player.UserId ~= 19081129)then
				if(Humanoid.MaxHealth >= MaxHP and Humanoid.Health > 0)then
					print'Got kill'
					Humanoid.Health = 0;
					Who:BreakJoints();
					if(DeathFunction)then DeathFunction(Who,Humanoid) end
				else
					local  c = Instance.new("ObjectValue",Hum)
					c.Name = "creator"
					c.Value = Plr
					S.Debris:AddItem(c,0.35)	
					if(Who:FindFirstChild'Head' and Humanoid.Health > 0)then
						ShowDamage((Who.Head.CFrame * CF.N(0, 0, (Who.Head.Size.Z / 2)).p+V3.N(0,1.5,0)+V3.N(M.RNG(-2,2),0,M.RNG(-2,2))), DoneDamage, 1.5, DamageColor)
					end
					local DoneDamage = DoneDamage*(DamageIsPercentage and Humanoid.MaxHealth/100 or 1)
					if(Humanoid.Health > 0 and Humanoid.Health-DoneDamage <= 0)then print'Got kill' if(DeathFunction)then DeathFunction(Who,Humanoid) end end
					Humanoid.Health = Humanoid.Health - DoneDamage
					if(OnHitFunc)then
						OnHitFunc(Who,HitTorso)
					end
				end
			end
		end
	end		
end

function AoE(where,range,func)
	local hit = {}
	for _,v in next, getRegion(where,range,{Char}) do
		local hum = (v.Parent and v.Parent:FindFirstChildOfClass'Humanoid')
		if(hum and not hit[hum])then
			hit[hum] = true
			func(v.Parent,hum)
		end
	end
	return hit
end

function AoEDamage(where,range,data)
	AoE(where,range,function(c,h)
		data.Who=c
		DealDamage(data)
	end)
end

--// EVERYTHING ELSE --

function Knockback(velocity,decay)
	return function(w,t)
		local BV = IN("BodyVelocity")
		BV.P=20000
		BV.MaxForce=V3.N(M.H,M.H,M.H)
		BV.Velocity=velocity or V3.N(0,25,0)+(Root.CFrame.lookVector*25)
		BV.Parent=t
		S.Debris:AddItem(BV,decay or .5)
	end
end

S.UserInputService.InputBegan:connect(function(io,gpe)
	if(gpe or Attack)then return end
end)


while true do
	swait()
	Sine=Sine+Change
	if(not Music or not Music.Parent)then
		local tp = (Music and Music.TimePosition)
		Music = Sound(MusicData.Parent,MusicData.ID,MusicData.Pitch,MusicData.Volume,true,false,true)
		Music.Name = 'Music'
		Music.TimePosition = tp
	end
	Music.SoundId = "rbxassetid://"..MusicData.ID
	Music.Parent = MusicData.Parent
	Music.Pitch = MusicData.Pitch
	Music.Volume = MusicData.Volume
	
	
	local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
	local Walking = Hum.MoveDirection.magnitude>0
	local State = (not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
	if(not EffectFolder or EffectFolder.Parent~=Char)then
		EffectFolder=Instance.new("Folder")
		EffectFolder.Name='Effects'
		EffectFolder.Parent=Char
	end
	
	--I know this looks like jl's
	--It's more inspired by my old one which is a modified ver of Kyu's, but replacing Root.Velocity with Hum.MoveDirection and removing the clamp
	local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
	local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
	local Vec = {
		X=RigDir.X+RigDir.Z,
		Z=FwdDir.X+FwdDir.Z
	};
	local Divide = 1
	if(Vec.Z<0)then
		Divide=math.clamp(-(1.25*Vec.Z),1,2)
	end
	Vec.Z = Vec.Z/Divide
	Vec.X = Vec.X/Divide
	Hum.WalkSpeed = WalkSpeed/Divide
	local Value = Movement/10
	if(legAnims)then
		if(State=='Walk')then
			Change=2
		elseif(State=='Idle')then
			Change=1
			if(not NeutralAnims)then

			end
		elseif(State=='Jump' or State=='Fall')then
			Change=1
		end
	end
	if(NeutralAnims)then	
		if(State == 'Idle')then
		  	local Alpha = .2
			Animate(NK,CF.N(0,1.48,-0.1)*CF.A(M.R(-10 + 10 * M.S(Sine/15)),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(LS,CF.N(-0.72,-0.83 - 0.2 * M.C(Sine/15),-0.65)*CF.A(M.R(45.4 - 10 * M.C(Sine/15)),M.R(37.2),M.R(-16)),Alpha,'Lerp')
		  	Animate(LH,CF.N(-1.01,-2.8 - 0.2 * M.C(Sine/15),-1.74)*CF.A(M.R(20 + 10 * M.C(Sine/15)),M.R(40),M.R(0)),Alpha,'Lerp')
		  	Animate(RJ,CF.N(0,1.24 + 0.2 * M.C(Sine/15),0.07)*CF.A(M.R(-20),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(RH,CF.N(0.89,-2.77 - 0.2 * M.C(Sine/15),-1.8)*CF.A(M.R(20 +  10 * M.C(Sine/15)),M.R(-30),M.R(0)),Alpha,'Lerp')
		  	Animate(RS,CF.N(0.68,-0.82 - 0.2 * M.C(Sine/15),-0.68)*CF.A(M.R(42.8 - 10 * M.C(Sine/15)),M.R(-28),M.R(11.2)),Alpha,'Lerp')


		elseif(State == 'Walk')then
			local Alpha = .2
			-- Im sorry nebby..i can't figure it out ;v;

			Animate(NK,CF.N(0,1.5,0)*CF.A(M.R(0 + 10 * M.C(Sine/2)),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(LS,CF.A(M.R(-(Sine*10)),M.R(0),M.R(0))*CF.N(-0.5,-1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(LH,CF.A(M.R(-(Sine*10)),M.R(0),M.R(0))*CF.N(-0.5,-3.99,0.01)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(RJ,CF.N(0 - 1 * M.S(Sine/4),0.70 + 5 * M.C(Sine/2),0)*CF.A(M.R(-30 + 10 * M.S(Sine/4)),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(RH,CF.A(M.R(-(Sine*10) + 180),M.R(0),M.R(0))*CF.N(0.5,-3.99,0.02)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha,'Lerp')
		  	Animate(RS,CF.A(M.R(-(Sine*10) + 180),M.R(0),M.R(0))*CF.N(0.5,-1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha,'Lerp')
	  	
		elseif(State == 'Jump')then
			local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
			Animate(NK,CF.N(0,1.45,0.19)*CF.A(M.R(15),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(LS,CF.N(-0.5,-1.06,-0.45)*CF.A(M.R(-20),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(LH,CF.N(-0.5,-3.35,0.61)*CF.A(M.R(-35),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RJ,CF.N(0,1.96,0.39)*CF.A(M.R(15),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RH,CF.N(0.5,-3.34,0.61)*CF.A(M.R(-35),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RS,CF.N(0.5,-1.06,-0.45)*CF.A(M.R(-20),M.R(0),M.R(0)),.2,'Lerp')
		elseif(State == 'Fall')then
			local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
			Animate(NK,CF.N(0,1.54,-0.22)*CF.A(M.R(-15),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(LS,CF.N(-0.5,-0.76,-0.86)*CF.A(M.R(45),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(LH,CF.N(-0.5,-2.58,-2.34)*CF.A(M.R(30),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RJ,CF.N(0,1.91,-0.51)*CF.A(M.R(-20),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RH,CF.N(0.5,-2.58,-2.33)*CF.A(M.R(30),M.R(0),M.R(0)),.2,'Lerp')
		  	Animate(RS,CF.N(0.5,-0.76,-0.86)*CF.A(M.R(45),M.R(0),M.R(0)),.2,'Lerp')
		end
	end

end
end

crazyv11=function()
	do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BacekndAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					ApplyDescription(RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Vector3zero = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local RootPartCFrame = RigHumanoidRootPart.CFrame - HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if Humanoid then
				ChangeState(Humanoid, Dead)
				Wait(Humanoid.Died)
			end

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = false
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						UnequipTools(Humanoid)
						taskwait()
						EquipTool(Humanoid, Tool)

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end

		if IsRegistered then
			SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
		else
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		{ MeshId = "138744606849121", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "83207562332062" },
		{ MeshId = "138744606849121", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "136752500636691" },
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = true,
		PredictionFling = false,
		Timeout = 4,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = true,
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = true,
	RigSize = 2,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
})

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Empyrean.Rig;
if Char:FindFirstChild("Accessory (VoidRPG)") then
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.C1 = CF.N(-.5,0,-1) * CF.A(0,math.rad(90),math.rad(-45))
end
if Char:FindFirstChild("Accessory (VoidAlligatorJaw)") then
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.C1 = CF.N(-.5,-5,-1.05) * CF.A(0,math.rad(90),math.rad(-135))
end
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/6), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/6)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),3+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+-64*M.S(Sine/24)), M.R(0+-64*M.S(Sine/24)) ,M.R(0+64*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(3+0*M.S(Sine/24),3+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(180+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-3+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(1+0*M.S(Sine/24),-4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(-20+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-1+0*M.S(Sine/24),-4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/6), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/6)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),3+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+-64*M.S(Sine/24)), M.R(0+-64*M.S(Sine/24)) ,M.R(0+64*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(3+0*M.S(Sine/24),3+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(180+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-3+0*M.S(Sine/10),0.5+0*M.S(Sine/24), 0+2*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RH',CF.N(1+0*M.S(Sine/10),-4+0*M.S(Sine/24), 0+2*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(-20+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-1+0*M.S(Sine/10),-4+0*M.S(Sine/24), 0+-2*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

fluent=loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
window=fluent:CreateWindow({
    Title='meowhook.cat';
    SubTitle='using fluent library!';
    TabWidth=160;
    Size=UDim2.fromOffset(580,460);
    Acrylic=true;
    Theme='Amethyst';
    MinimizeKey=Enum.KeyCode.RightAlt;
})
options=fluent.Options
reanimate=window:AddTab({ Title='reanimate';icon=''})
reanimate:AddButton({ Title='chill void (rcd)';Callback=function() chillvoid1() end;})
reanimate:AddButton({ Title='among us (rcd)';Callback=function() amongus1() end;})
reanimate:AddButton({ Title='doll (rcd)';Callback=function() doll1() end;})
reanimate:AddButton({ Title='da feets (rcd)';Callback=function() dafeets1() end;})
reanimate:AddButton({ Title='c r a z y v 1 (rcd)';Callback=function() crazyv11() end;})
reanimate:AddButton({ Title='chill void (jab)';Callback=function() chillvoid2() end;})
reanimate:AddButton({ Title='among us (jab)';Callback=function() amongus2() end;})
reanimate:AddButton({ Title='doll (jab)';Callback=function() doll2() end;})
reanimate:AddButton({ Title='da feets (jab)';Callback=function() dafeets2() end;})
misc=window:AddTab({ Title='misc';icon=''})
misc:AddButton({ Title='purple lighting';Callback=function() purplelighting1() end;})
misc:AddButton({ Title='teleport to meowplate';Callback=function() teleport1() end;})
