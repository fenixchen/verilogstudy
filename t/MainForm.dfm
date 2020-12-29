object FormTable: TFormTable
  Left = 48
  Top = 7
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Table Editor'
  ClientHeight = 699
  ClientWidth = 1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBMemo1: TDBRichEdit
    Left = 0
    Top = 479
    Width = 1075
    Height = 203
    Align = alBottom
    DataField = 'Description'
    DataSource = RegisterSource
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 13
    OnEnter = DBMemo1Enter
    OnExit = DBMemo1Exit
    OnSelectionChange = DBMemo1SelectionChange
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 929
    Height = 466
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Tabs/Pages'
      object Panel2: TPanel
        Left = 12
        Top = -3
        Width = 273
        Height = 449
        TabOrder = 0
        object Label1: TLabel
          Left = 4
          Top = 12
          Width = 58
          Height = 13
          Caption = 'Tab Caption'
        end
        object Label23: TLabel
          Left = 8
          Top = 44
          Width = 38
          Height = 13
          Caption = 'All Tabs'
        end
        object DBEdit2: TDBEdit
          Left = 64
          Top = 8
          Width = 157
          Height = 21
          DataField = 'Caption'
          DataSource = TabSource
          TabOrder = 0
        end
        object llbTab: TDBLookupListBox
          Left = 64
          Top = 36
          Width = 157
          Height = 355
          Ctl3D = True
          KeyField = 'ID'
          ListField = 'Caption'
          ListSource = TabSource
          ParentCtl3D = False
          TabOrder = 1
        end
        object nvTab: TDBNavigatorEx
          Left = 28
          Top = 402
          Width = 205
          Height = 33
          DataSource = TabSource
          VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
          TabOrder = 2
        end
      end
      object Panel3: TPanel
        Left = 300
        Top = -3
        Width = 553
        Height = 449
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 44
          Width = 64
          Height = 13
          Caption = 'Page Caption'
        end
        object Label24: TLabel
          Left = 12
          Top = 72
          Width = 44
          Height = 13
          Caption = 'All Pages'
        end
        object Label16: TLabel
          Left = 12
          Top = 16
          Width = 56
          Height = 13
          Caption = 'Page Name'
        end
        object DBEdit1: TDBEdit
          Left = 76
          Top = 40
          Width = 167
          Height = 21
          DataField = 'Caption'
          DataSource = PageSource
          TabOrder = 1
        end
        object llbPage: TDBLookupListBox
          Left = 76
          Top = 68
          Width = 167
          Height = 316
          Ctl3D = True
          KeyField = 'ID'
          ListField = 'Caption'
          ListSource = PageSource
          ParentCtl3D = False
          TabOrder = 2
        end
        object nvPage: TDBNavigatorEx
          Left = 75
          Top = 406
          Width = 420
          Height = 33
          DataSource = PageSource
          VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
          TabOrder = 3
        end
        object plPage: TPanel
          Left = 262
          Top = 10
          Width = 233
          Height = 389
          TabOrder = 4
          object Label14: TLabel
            Left = 28
            Top = 290
            Width = 19
            Height = 13
            Caption = 'Tag'
          end
          object Label69: TLabel
            Left = 12
            Top = 10
            Width = 24
            Height = 13
            Caption = 'Type'
          end
          object Label18: TLabel
            Left = 26
            Top = 312
            Width = 68
            Height = 13
            Caption = 'Slave Address'
          end
          object Label19: TLabel
            Left = 26
            Top = 336
            Width = 35
            Height = 13
            Caption = 'Column'
          end
          object Label21: TLabel
            Left = 26
            Top = 364
            Width = 22
            Height = 13
            Caption = 'Row'
          end
          object DBEdit9: TDBEdit
            Left = 158
            Top = 286
            Width = 57
            Height = 21
            DataField = 'Tag'
            DataSource = PageSource
            TabOrder = 0
            OnChange = dedPageRegValChange
            OnEnter = dedPageRegValChange
          end
          object dbcbPageType: TRxDBComboBox
            Left = 48
            Top = 6
            Width = 177
            Height = 21
            Style = csDropDownList
            DataField = 'PageType'
            DataSource = PageSource
            DropDownCount = 50
            EnableValues = True
            ItemHeight = 13
            TabOrder = 1
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18'
              '19'
              '20'
              '21'
              '22'
              '23'
              '24'
              '25'
              '26'
              '27'
              '28'
              '29'
              '30'
              '31'
              '32'
              '33'
              '34'
              '35'
              '36'
              '37'
              '38'
              '39'
              '40'
              '41'
              '42'
              '43'
              '44'
              '45'
              '46'
              '47'
              '48'
              '49'
              '50'
              '51'
              '52'
              '53'
              '54'
              '55'
              '56'
              '57'
              '58'
              '59'
              '60')
            OnChange = dbcbPageTypeChange
            OnClick = dbcbPageTypeChange
          end
          object Panel4: TPanel
            Left = 14
            Top = 38
            Width = 209
            Height = 243
            TabOrder = 2
            object lblPageRegVal: TLabel
              Left = 13
              Top = 12
              Width = 97
              Height = 13
              Caption = 'Page Register Value'
            end
            object lblShadowReg: TLabel
              Left = 13
              Top = 42
              Width = 81
              Height = 13
              Caption = 'Shadow Register'
            end
            object lblShadowRegVal: TLabel
              Left = 13
              Top = 73
              Width = 111
              Height = 13
              Caption = 'Shadow Register Value'
            end
            object lblShadowRegMask: TLabel
              Left = 13
              Top = 103
              Width = 110
              Height = 13
              Caption = 'Shadow Register Mask'
            end
            object lblIndexReg: TLabel
              Left = 13
              Top = 133
              Width = 68
              Height = 13
              Caption = 'Index Register'
            end
            object lblDataReg: TLabel
              Left = 13
              Top = 163
              Width = 65
              Height = 13
              Caption = 'Data Register'
            end
            object lblRegAddrSize: TLabel
              Left = 13
              Top = 188
              Width = 125
              Height = 13
              Caption = 'Register Sub Address Size'
            end
            object lblRegDataSize: TLabel
              Left = 13
              Top = 214
              Width = 88
              Height = 13
              Caption = 'Register Data Size'
            end
            object dedPageRegVal: TDBEdit
              Left = 144
              Top = 8
              Width = 57
              Height = 21
              DataField = 'PageRegVal'
              DataSource = PageSource
              TabOrder = 0
              OnChange = dedPageRegValChange
              OnEnter = dedPageRegValChange
            end
            object dedShadowReg: TDBEdit
              Left = 144
              Top = 38
              Width = 57
              Height = 21
              DataField = 'ShadowReg'
              DataSource = PageSource
              TabOrder = 1
              OnChange = dedPageRegValChange
              OnEnter = dedPageRegValChange
            end
            object dedShadowRegVal: TDBEdit
              Left = 144
              Top = 67
              Width = 57
              Height = 21
              DataField = 'ShadowRegVal'
              DataSource = PageSource
              TabOrder = 2
              OnChange = dedPageRegValChange
              OnEnter = dedPageRegValChange
            end
            object dedShadowRegMask: TDBEdit
              Left = 144
              Top = 97
              Width = 57
              Height = 21
              DataField = 'ShadowRegMask'
              DataSource = PageSource
              TabOrder = 3
              OnChange = dedPageRegValChange
              OnEnter = dedPageRegValChange
            end
            object dedIndexReg: TDBEdit
              Left = 144
              Top = 126
              Width = 57
              Height = 21
              DataField = 'IndexReg'
              DataSource = PageSource
              TabOrder = 4
              OnChange = dedPageRegValChange
              OnEnter = dedPageRegValChange
            end
            object dedDataReg: TDBEdit
              Left = 144
              Top = 156
              Width = 57
              Height = 21
              AutoSelect = False
              DataField = 'DataReg'
              DataSource = PageSource
              TabOrder = 5
              OnChange = dedPageRegValChange
              OnEnter = dedPageRegValChange
            end
            object dedRegAddrSize: TDBEdit
              Left = 144
              Top = 184
              Width = 57
              Height = 21
              AutoSelect = False
              DataField = 'RegAddressSize'
              DataSource = PageSource
              TabOrder = 6
              OnChange = dedPageRegValChange
              OnEnter = dedPageRegValChange
            end
            object dedRegDataSize: TDBEdit
              Left = 144
              Top = 212
              Width = 57
              Height = 21
              DataField = 'RegDataSize'
              DataSource = PageSource
              TabOrder = 7
              OnChange = dedPageRegValChange
              OnEnter = dedPageRegValChange
            end
          end
          object DBEdit3: TDBEdit
            Left = 158
            Top = 310
            Width = 57
            Height = 21
            DataField = 'SlaveAddr'
            DataSource = PageSource
            TabOrder = 3
            OnChange = dedPageRegValChange
            OnEnter = dedPageRegValChange
          end
          object DBEdit4: TDBEdit
            Left = 158
            Top = 334
            Width = 57
            Height = 21
            DataField = 'Column'
            DataSource = PageSource
            TabOrder = 4
            OnChange = dedPageRegValChange
            OnEnter = dedPageRegValChange
          end
          object DBEdit5: TDBEdit
            Left = 158
            Top = 360
            Width = 57
            Height = 21
            DataField = 'Row'
            DataSource = PageSource
            TabOrder = 5
            OnChange = dedPageRegValChange
            OnEnter = dedPageRegValChange
          end
        end
        object DBEdit10: TDBEdit
          Left = 76
          Top = 12
          Width = 167
          Height = 21
          DataField = 'Name'
          DataSource = PageSource
          TabOrder = 0
        end
        object dblklstdblkCopyPage: TDBLookupListBox
          Left = 262
          Top = 164
          Width = 233
          Height = 225
          Ctl3D = True
          KeyField = 'ID'
          ListField = 'Caption'
          ListSource = dsCopyPageSource
          ParentCtl3D = False
          TabOrder = 5
          Visible = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Registers'
      ImageIndex = 1
      object Label34: TLabel
        Left = 8
        Top = 8
        Width = 127
        Height = 13
        Caption = 'Register Browsing by Page'
      end
      object plRegister: TPanel
        Left = 494
        Top = 32
        Width = 403
        Height = 277
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 12
          Width = 70
          Height = 13
          Caption = 'Register Name'
        end
        object Label4: TLabel
          Left = 8
          Top = 52
          Width = 80
          Height = 13
          Caption = 'Register Address'
        end
        object lblDefaultVal: TLabel
          Left = 8
          Top = 92
          Width = 64
          Height = 13
          Caption = 'Default Value'
        end
        object Label20: TLabel
          Left = 8
          Top = 220
          Width = 53
          Height = 13
          Caption = 'Description'
        end
        object Label13: TLabel
          Left = 8
          Top = 132
          Width = 62
          Height = 13
          Caption = 'Register Flag'
        end
        object dedRegName: TDBEdit
          Left = 8
          Top = 28
          Width = 151
          Height = 21
          DataField = 'RegName'
          DataSource = RegisterSource
          TabOrder = 0
        end
        object dedRegAddress: TDBEdit
          Left = 8
          Top = 68
          Width = 65
          Height = 21
          DataField = 'RegAddress'
          DataSource = RegisterSource
          TabOrder = 1
          OnChange = dedPageRegValChange
        end
        object dedDefaultVal: TDBEdit
          Left = 8
          Top = 108
          Width = 65
          Height = 21
          DataField = 'DefaultVal'
          DataSource = RegisterSource
          TabOrder = 2
          OnChange = dedPageRegValChange
          OnEnter = dedPageRegValChange
        end
        object pcBitAccessRight: TPageControl
          Left = 180
          Top = 12
          Width = 197
          Height = 221
          ActivePage = tsBit00
          TabOrder = 4
          object tsBit00: TTabSheet
            Caption = 'Bit0-Bit7'
            object Label5: TLabel
              Left = 20
              Top = 4
              Width = 21
              Height = 13
              Caption = 'Bit 0'
            end
            object Label6: TLabel
              Left = 20
              Top = 28
              Width = 21
              Height = 13
              Caption = 'Bit 1'
            end
            object Label7: TLabel
              Left = 20
              Top = 52
              Width = 21
              Height = 13
              Caption = 'Bit 2'
            end
            object Label8: TLabel
              Left = 20
              Top = 76
              Width = 21
              Height = 13
              Caption = 'Bit 3'
            end
            object Label9: TLabel
              Left = 20
              Top = 100
              Width = 21
              Height = 13
              Caption = 'Bit 4'
            end
            object Label10: TLabel
              Left = 20
              Top = 124
              Width = 21
              Height = 13
              Caption = 'Bit 5'
            end
            object Label11: TLabel
              Left = 20
              Top = 148
              Width = 21
              Height = 13
              Caption = 'Bit 6'
            end
            object Label12: TLabel
              Left = 20
              Top = 172
              Width = 21
              Height = 13
              Caption = 'Bit 7'
            end
            object RxDBComboBox1: TRxDBComboBox
              Left = 52
              Top = 0
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit0Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox2: TRxDBComboBox
              Left = 52
              Top = 24
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit1Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox3: TRxDBComboBox
              Left = 52
              Top = 48
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit2Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox4: TRxDBComboBox
              Left = 52
              Top = 72
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit3Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 3
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox5: TRxDBComboBox
              Left = 52
              Top = 96
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit4Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 4
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox6: TRxDBComboBox
              Left = 52
              Top = 120
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit5Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 5
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox7: TRxDBComboBox
              Left = 52
              Top = 144
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit6Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 6
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox8: TRxDBComboBox
              Left = 52
              Top = 168
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit7Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 7
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
          end
          object tsBit08: TTabSheet
            Caption = 'Bit8-Bit15'
            ImageIndex = 1
            object Label38: TLabel
              Left = 20
              Top = 4
              Width = 21
              Height = 13
              Caption = 'Bit 8'
            end
            object Label39: TLabel
              Left = 20
              Top = 28
              Width = 21
              Height = 13
              Caption = 'Bit 9'
            end
            object Label40: TLabel
              Left = 20
              Top = 52
              Width = 27
              Height = 13
              Caption = 'Bit 10'
            end
            object Label41: TLabel
              Left = 20
              Top = 76
              Width = 27
              Height = 13
              Caption = 'Bit 11'
            end
            object Label42: TLabel
              Left = 20
              Top = 100
              Width = 27
              Height = 13
              Caption = 'Bit 12'
            end
            object Label43: TLabel
              Left = 20
              Top = 124
              Width = 27
              Height = 13
              Caption = 'Bit 13'
            end
            object Label45: TLabel
              Left = 20
              Top = 148
              Width = 27
              Height = 13
              Caption = 'Bit 14'
            end
            object Label46: TLabel
              Left = 20
              Top = 172
              Width = 27
              Height = 13
              Caption = 'Bit 15'
            end
            object RxDBComboBox9: TRxDBComboBox
              Left = 52
              Top = 0
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit8Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox10: TRxDBComboBox
              Left = 52
              Top = 24
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit9Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox11: TRxDBComboBox
              Left = 52
              Top = 48
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit10Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox12: TRxDBComboBox
              Left = 52
              Top = 72
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit11Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 3
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox13: TRxDBComboBox
              Left = 52
              Top = 96
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit12Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 4
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox14: TRxDBComboBox
              Left = 52
              Top = 120
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit13Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 5
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox15: TRxDBComboBox
              Left = 52
              Top = 144
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit14Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 6
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox16: TRxDBComboBox
              Left = 52
              Top = 168
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit15Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 7
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
          end
          object tsBit16: TTabSheet
            Caption = 'Bit16-Bit23'
            ImageIndex = 2
            object Label47: TLabel
              Left = 20
              Top = 4
              Width = 27
              Height = 13
              Caption = 'Bit 16'
            end
            object Label48: TLabel
              Left = 20
              Top = 28
              Width = 27
              Height = 13
              Caption = 'Bit 17'
            end
            object Label49: TLabel
              Left = 20
              Top = 52
              Width = 27
              Height = 13
              Caption = 'Bit 18'
            end
            object Label50: TLabel
              Left = 20
              Top = 76
              Width = 27
              Height = 13
              Caption = 'Bit 19'
            end
            object Label51: TLabel
              Left = 20
              Top = 100
              Width = 27
              Height = 13
              Caption = 'Bit 20'
            end
            object Label52: TLabel
              Left = 20
              Top = 124
              Width = 27
              Height = 13
              Caption = 'Bit 21'
            end
            object Label53: TLabel
              Left = 20
              Top = 148
              Width = 27
              Height = 13
              Caption = 'Bit 22'
            end
            object Label54: TLabel
              Left = 20
              Top = 172
              Width = 27
              Height = 13
              Caption = 'Bit 23'
            end
            object RxDBComboBox17: TRxDBComboBox
              Left = 52
              Top = 0
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit16Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox18: TRxDBComboBox
              Left = 52
              Top = 24
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit17Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox19: TRxDBComboBox
              Left = 52
              Top = 48
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit18Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox20: TRxDBComboBox
              Left = 52
              Top = 72
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit19Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 3
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox21: TRxDBComboBox
              Left = 52
              Top = 96
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit20Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 4
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox22: TRxDBComboBox
              Left = 52
              Top = 120
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit21Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 5
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox23: TRxDBComboBox
              Left = 52
              Top = 144
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit22Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 6
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox24: TRxDBComboBox
              Left = 52
              Top = 168
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit23Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 7
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
          end
          object tsBit24: TTabSheet
            Caption = 'Bit24-Bit31'
            ImageIndex = 3
            object Label55: TLabel
              Left = 20
              Top = 4
              Width = 27
              Height = 13
              Caption = 'Bit 24'
            end
            object Label56: TLabel
              Left = 20
              Top = 28
              Width = 27
              Height = 13
              Caption = 'Bit 25'
            end
            object Label57: TLabel
              Left = 20
              Top = 52
              Width = 27
              Height = 13
              Caption = 'Bit 26'
            end
            object Label58: TLabel
              Left = 20
              Top = 76
              Width = 27
              Height = 13
              Caption = 'Bit 27'
            end
            object Label59: TLabel
              Left = 20
              Top = 100
              Width = 27
              Height = 13
              Caption = 'Bit 28'
            end
            object Label60: TLabel
              Left = 20
              Top = 124
              Width = 27
              Height = 13
              Caption = 'Bit 29'
            end
            object Label61: TLabel
              Left = 20
              Top = 148
              Width = 27
              Height = 13
              Caption = 'Bit 30'
            end
            object Label62: TLabel
              Left = 20
              Top = 172
              Width = 27
              Height = 13
              Caption = 'Bit 31'
            end
            object RxDBComboBox25: TRxDBComboBox
              Left = 52
              Top = 0
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit24Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox26: TRxDBComboBox
              Left = 52
              Top = 24
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit25Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox27: TRxDBComboBox
              Left = 52
              Top = 48
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit26Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox28: TRxDBComboBox
              Left = 52
              Top = 72
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit27Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 3
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox29: TRxDBComboBox
              Left = 52
              Top = 96
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit28Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 4
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox30: TRxDBComboBox
              Left = 52
              Top = 120
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit29Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 5
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox31: TRxDBComboBox
              Left = 52
              Top = 144
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit30Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 6
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object RxDBComboBox32: TRxDBComboBox
              Left = 52
              Top = 168
              Width = 89
              Height = 21
              Style = csDropDownList
              DataField = 'Bit31Right'
              DataSource = RegisterSource
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Not Used'
                'Read Only'
                'Write Only'
                'Read/Write')
              TabOrder = 7
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
          end
        end
        object RxDBComboBox33: TRxDBComboBox
          Left = 8
          Top = 148
          Width = 89
          Height = 21
          Style = csDropDownList
          DataField = 'Flag'
          DataSource = RegisterSource
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Level0'
            'Level1'
            'Level2'
            'Level3')
          TabOrder = 3
          Values.Strings = (
            '0'
            '1'
            '2'
            '3')
        end
        object btnReadOnly: TButton
          Left = 58
          Top = 184
          Width = 101
          Height = 25
          Caption = 'Set All  >>'
          PopupMenu = popBit
          TabOrder = 5
          OnMouseUp = btnReadOnlyMouseUp
        end
      end
      object nvRegister: TDBNavigatorEx
        Left = 596
        Top = 332
        Width = 250
        Height = 39
        DataSource = RegisterSource
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        TabOrder = 4
      end
      object btnGetDefault: TButton
        Left = 594
        Top = 2
        Width = 100
        Height = 25
        Caption = 'Get Default Value'
        Enabled = False
        TabOrder = 2
        OnClick = btnGetDefaultClick
      end
      object StringGridReg: TStringGrid
        Left = 8
        Top = 30
        Width = 473
        Height = 396
        Color = clInfoBk
        ColCount = 17
        DefaultColWidth = 20
        DefaultRowHeight = 20
        RowCount = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'BatangChe'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected]
        ParentFont = False
        TabOrder = 1
        OnKeyPress = StringGridRegKeyPress
        OnSelectCell = StringGridRegSelectCell
        ColWidths = (
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          21
          20
          20
          20
          20)
      end
      object lcbPage: TDBLookupComboBox
        Left = 140
        Top = 4
        Width = 261
        Height = 21
        DropDownRows = 50
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyField = 'ID'
        ListField = 'Caption'
        ListSource = LookupPageSource
        ParentFont = False
        TabOrder = 0
        OnClick = lcbPageClick
      end
      object btnCopy: TButton
        Left = 494
        Top = 2
        Width = 100
        Height = 25
        Caption = 'Copy Page From...'
        TabOrder = 5
        OnClick = btnCopyClick
      end
      object cbAddAll: TCheckBox
        Left = 492
        Top = 348
        Width = 97
        Height = 15
        Caption = 'Add all registers'
        TabOrder = 6
      end
      object btnAutoGetReadonlyAttr: TButton
        Left = 694
        Top = 2
        Width = 100
        Height = 25
        Caption = 'Auto ROnly Attr'
        Enabled = False
        TabOrder = 7
      end
      object cbSetRW: TButton
        Left = 794
        Top = 2
        Width = 100
        Height = 25
        Caption = 'Set All R/W'
        TabOrder = 8
        OnClick = cbSetRWClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Filters'
      ImageIndex = 2
      object Label17: TLabel
        Left = 28
        Top = 44
        Width = 41
        Height = 13
        Caption = 'All Filters'
      end
      object Label15: TLabel
        Left = 4
        Top = 16
        Width = 66
        Height = 13
        Caption = 'Filters Caption'
      end
      object lblBitMask: TLabel
        Left = 14
        Top = 322
        Width = 64
        Height = 13
        Caption = 'Access Mask'
      end
      object llbFilter: TDBLookupListBox
        Left = 92
        Top = 38
        Width = 255
        Height = 251
        KeyField = 'ID'
        ListField = 'Caption'
        ListSource = FilterSource
        TabOrder = 1
      end
      object nvFilter: TDBNavigatorEx
        Left = 94
        Top = 298
        Width = 250
        Height = 35
        DataSource = FilterSource
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        TabOrder = 2
      end
      object dedFilterCaption: TDBEdit
        Left = 92
        Top = 12
        Width = 253
        Height = 21
        DataField = 'Caption'
        DataSource = FilterSource
        TabOrder = 0
      end
      object lcbPage2: TDBLookupComboBox
        Left = 364
        Top = 12
        Width = 285
        Height = 21
        DropDownRows = 50
        KeyField = 'ID'
        ListField = 'Caption'
        ListSource = LookupPageSource
        TabOrder = 3
        OnClick = lcbPage2Click
      end
      object StringGridReg2: TStringGrid
        Left = 364
        Top = 38
        Width = 501
        Height = 404
        Color = clInfoBk
        ColCount = 17
        DefaultColWidth = 20
        DefaultRowHeight = 20
        RowCount = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'BatangChe'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnDrawCell = StringGridReg2DrawCell
        OnMouseUp = StringGridReg2MouseUp
        OnSelectCell = StringGridReg2SelectCell
        ColWidths = (
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20)
      end
      object pcMask: TPageControl
        Left = 12
        Top = 338
        Width = 337
        Height = 93
        ActivePage = tsBit31
        TabOrder = 6
        object tsBit15: TTabSheet
          Caption = 'Bit 15 - Bit 0'
        end
        object tsBit31: TTabSheet
          Caption = 'Bit 31 - Bit 16'
          ImageIndex = 1
        end
      end
      object cbInFilter: TCheckBox
        Left = 672
        Top = 14
        Width = 97
        Height = 17
        Caption = 'In This Filter'
        TabOrder = 4
        OnClick = cbInFilterClick
      end
    end
  end
  object btnExit: TButton
    Left = 943
    Top = 420
    Width = 122
    Height = 31
    Caption = 'Exit'
    TabOrder = 6
    OnClick = btnExitClick
  end
  object btnGenerate: TButton
    Left = 943
    Top = 170
    Width = 122
    Height = 31
    Caption = 'Generate TDB File ...'
    TabOrder = 3
    OnClick = btnGenerateClick
  end
  object btnLoad: TButton
    Left = 943
    Top = 70
    Width = 122
    Height = 31
    Caption = 'Choose MDB File ...'
    TabOrder = 5
    OnClick = btnLoadClick
  end
  object btnBackup: TButton
    Left = 807
    Top = 326
    Width = 122
    Height = 31
    Caption = 'Backup MDB File'
    Enabled = False
    TabOrder = 4
    Visible = False
    OnClick = btnBackupClick
  end
  object btnCreate: TButton
    Left = 943
    Top = 20
    Width = 122
    Height = 31
    Caption = 'Create MDB File ...'
    TabOrder = 1
    OnClick = btnCreateClick
  end
  object btnMerge: TButton
    Left = 815
    Top = 286
    Width = 122
    Height = 31
    Caption = 'Merge From MDB File ...'
    TabOrder = 2
    Visible = False
    OnClick = btnMergeClick
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 455
    Width = 1075
    Height = 24
    Align = alBottom
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 7
    object CutButton: TToolButton
      Left = 0
      Top = 2
      Caption = 'CutButton'
      ImageIndex = 0
      OnClick = EditCutClick
    end
    object CopyButton: TToolButton
      Left = 23
      Top = 2
      Caption = 'CopyButton'
      ImageIndex = 1
      OnClick = EditCopyClick
    end
    object PasteButton: TToolButton
      Left = 46
      Top = 2
      Caption = 'PasteButton'
      ImageIndex = 2
      OnClick = EditPasteClick
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object FontName: TFontComboBox
      Left = 77
      Top = 3
      Width = 145
      Height = 20
      TabOrder = 0
      OnChange = FontNameChange
    end
    object FontColor: TColorComboBox
      Left = 222
      Top = 3
      Width = 145
      Height = 20
      ColorValue = clBlue
      TabOrder = 1
      OnChange = FontColorChange
    end
    object FontSize: TEdit
      Left = 367
      Top = 2
      Width = 50
      Height = 22
      TabOrder = 2
      Text = '0'
      OnChange = FontSizeChange
    end
    object UpDown1: TUpDown
      Left = 417
      Top = 2
      Width = 15
      Height = 22
      Associate = FontSize
      Min = 0
      Position = 0
      TabOrder = 3
      Wrap = False
    end
    object ToolButton5: TToolButton
      Left = 432
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object BoldButton: TToolButton
      Left = 440
      Top = 2
      AllowAllUp = True
      Caption = 'BoldButton'
      ImageIndex = 112
      Style = tbsCheck
      OnClick = BoldButtonClick
    end
    object ItalicButton: TToolButton
      Left = 463
      Top = 2
      AllowAllUp = True
      Caption = 'ItalicButton'
      ImageIndex = 113
      Style = tbsCheck
      OnClick = ItalicButtonClick
    end
    object UnderlineButton: TToolButton
      Left = 486
      Top = 2
      AllowAllUp = True
      Caption = 'UnderlineButton'
      ImageIndex = 114
      Style = tbsCheck
      OnClick = UnderlineButtonClick
    end
    object ToolButton9: TToolButton
      Left = 509
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object LeftAlign: TToolButton
      Left = 517
      Top = 2
      Caption = 'LeftAlign'
      Grouped = True
      ImageIndex = 115
      Style = tbsCheck
      OnClick = AlignClick
    end
    object CenterAlign: TToolButton
      Tag = 2
      Left = 540
      Top = 2
      Caption = 'CenterAlign'
      Grouped = True
      ImageIndex = 116
      Style = tbsCheck
      OnClick = AlignClick
    end
    object RightAlign: TToolButton
      Tag = 1
      Left = 563
      Top = 2
      Caption = 'RightAlign'
      Grouped = True
      ImageIndex = 117
      Style = tbsCheck
      OnClick = AlignClick
    end
    object ToolButton13: TToolButton
      Left = 586
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object BulletsButton: TToolButton
      Left = 594
      Top = 2
      Caption = 'BulletsButton'
      ImageIndex = 118
      Style = tbsCheck
      OnClick = BulletsButtonClick
    end
  end
  object btnGenDoc: TButton
    Left = 807
    Top = 248
    Width = 122
    Height = 31
    Caption = 'Generate Document...'
    TabOrder = 8
    Visible = False
    OnClick = btnGenDocClick
  end
  object RichEdit1: TRichEdit
    Left = 496
    Top = 536
    Width = 81
    Height = 25
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 9
    Visible = False
  end
  object btnCopyFromMDB: TButton
    Left = 815
    Top = 371
    Width = 122
    Height = 31
    Caption = 'Copy From MDB File ...'
    TabOrder = 11
    Visible = False
    OnClick = btnCopyFromMDBClick
  end
  object btnCopyPage: TButton
    Left = 567
    Top = 411
    Width = 233
    Height = 25
    Caption = 'Copy Register description'
    TabOrder = 12
    Visible = False
    OnClick = btnCopyPageClick
  end
  object btnSetAll: TButton
    Left = 943
    Top = 370
    Width = 122
    Height = 31
    Caption = 'Set All Flag'
    TabOrder = 10
    OnClick = btnSetAllClick
  end
  object btnSetAllWrite: TButton
    Left = 943
    Top = 270
    Width = 122
    Height = 31
    Caption = 'Set All WriteOnly'
    TabOrder = 14
    OnClick = btnSetAllWriteClick
  end
  object btnSetAllRead: TButton
    Left = 943
    Top = 320
    Width = 122
    Height = 31
    Caption = 'Set All ReadOnly'
    TabOrder = 15
    OnClick = btnSetAllReadClick
  end
  object GenHeadFile: TButton
    Left = 943
    Top = 220
    Width = 121
    Height = 33
    Caption = 'Generate Head File'
    TabOrder = 16
    OnClick = GenHeadFileClick
  end
  object pbImport: TProgressBar
    Left = 0
    Top = 682
    Width = 1075
    Height = 17
    Align = alBottom
    Min = 0
    Max = 100
    Step = 1
    TabOrder = 17
    Visible = False
  end
  object btnImport: TButton
    Left = 943
    Top = 120
    Width = 122
    Height = 31
    Caption = 'Import CSV Files...'
    TabOrder = 18
    OnClick = btnImportClick
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\dp' +
      'tvsdk\Tool\DPTVTools\chipdebugger\SVP-EX.mdb;Mode=Share Deny Non' +
      'e;Persist Security Info=False;Jet OLEDB:System database="";Jet O' +
      'LEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:E' +
      'ngine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global ' +
      'Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLED' +
      'B:New Database Password="";Jet OLEDB:Create System Database=Fals' +
      'e;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale o' +
      'n Compact=False;Jet OLEDB:Compact Without Replica Repair=False;J' +
      'et OLEDB:SFP=False;'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 774
    Top = 641
  end
  object TabTable: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterPost = TabTableAfterScroll
    BeforeDelete = TabTableBeforeDelete
    AfterScroll = TabTableAfterScroll
    TableName = 'Tab'
    Left = 806
    Top = 641
  end
  object PageTable: TADOTable
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterInsert = PageTableAfterInsert
    AfterPost = PageTableAfterPost
    AfterCancel = FilterTableAfterScroll
    BeforeDelete = PageTableBeforeDelete
    AfterDelete = PageTableAfterPost
    AfterScroll = PageTableAfterScroll
    IndexFieldNames = 'Name'
    TableName = 'Page'
    Left = 838
    Top = 641
    object PageTableID: TAutoIncField
      FieldName = 'ID'
    end
    object PageTablePageType: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'PageType'
    end
    object PageTablePageRegVal: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'PageRegVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object PageTableShadowReg: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object PageTableShadowRegVal: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowRegVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object PageTableShadowRegMask: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowRegMask'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object PageTableIndexReg: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'IndexReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object PageTableDataReg: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'DataReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object PageTableRegAddressSize: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'RegAddressSize'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 4
      MinValue = 1
    end
    object PageTableRegDataSize: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'RegDataSize'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 4
      MinValue = 1
    end
    object PageTableDescription: TWideStringField
      FieldName = 'Caption'
      Required = True
      Size = 50
    end
    object PageTableTab: TIntegerField
      FieldName = 'Tab'
    end
    object PageTableTag: TIntegerField
      FieldName = 'Tag'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object PageTableName: TWideStringField
      FieldName = 'Name'
      Required = True
      Size = 32
    end
    object PageTableSlaveAddr: TWordField
      FieldName = 'SlaveAddr'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object PageTableColumn: TIntegerField
      FieldName = 'Column'
      MaxValue = 256
      MinValue = 4
    end
    object PageTableRow: TIntegerField
      FieldName = 'Row'
      MaxValue = 256
      MinValue = 4
    end
  end
  object LookupPageTable: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Page'
    Left = 838
    Top = 577
  end
  object RegisterTable: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = RegisterTableAfterInsert
    AfterEdit = RegisterTableAfterEdit
    BeforePost = RegisterTableBeforePost
    AfterPost = RegisterTableAfterPost
    AfterCancel = RegisterTableAfterCancel
    BeforeDelete = RegisterTableBeforeDelete
    AfterDelete = RegisterTableAfterPost
    AfterScroll = PageTableAfterScroll
    TableName = 'Register'
    Left = 902
    Top = 609
    object RegisterTableID: TAutoIncField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
    end
    object RegisterTableRegName: TWideStringField
      DisplayWidth = 255
      FieldName = 'RegName'
      Size = 255
    end
    object RegisterTablePage: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Page'
    end
    object RegisterTableRegAddress: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'RegAddress'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object RegisterTableDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
    end
    object RegisterTableDefaultVal: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DefaultVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object RegisterTableBit0Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit0Right'
    end
    object RegisterTableBit1Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit1Right'
    end
    object RegisterTableBit2Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit2Right'
    end
    object RegisterTableBit3Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit3Right'
    end
    object RegisterTableBit4Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit4Right'
    end
    object RegisterTableBit5Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit5Right'
    end
    object RegisterTableBit6Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit6Right'
    end
    object RegisterTableBit7Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit7Right'
    end
    object RegisterTableBit8Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit8Right'
    end
    object RegisterTableBit9Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit9Right'
    end
    object RegisterTableBit10Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit10Right'
    end
    object RegisterTableBit11Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit11Right'
    end
    object RegisterTableBit12Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit12Right'
    end
    object RegisterTableBit13Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit13Right'
    end
    object RegisterTableBit14Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit14Right'
    end
    object RegisterTableBit15Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit15Right'
    end
    object RegisterTableBit16Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit16Right'
    end
    object RegisterTableBit17Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit17Right'
    end
    object RegisterTableBit18Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit18Right'
    end
    object RegisterTableBit19Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit19Right'
    end
    object RegisterTableBit20Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit20Right'
    end
    object RegisterTableBit21Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit21Right'
    end
    object RegisterTableBit22Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit22Right'
    end
    object RegisterTableBit23Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit23Right'
    end
    object RegisterTableBit24Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit24Right'
    end
    object RegisterTableBit25Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit25Right'
    end
    object RegisterTableBit26Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit26Right'
    end
    object RegisterTableBit27Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit27Right'
    end
    object RegisterTableBit28Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit28Right'
    end
    object RegisterTableBit29Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit29Right'
    end
    object RegisterTableBit30Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit30Right'
    end
    object RegisterTableBit31Right: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit31Right'
    end
    object RegisterTableFlag: TIntegerField
      FieldName = 'Flag'
    end
  end
  object FilterTable: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = FilterTableAfterInsert
    AfterPost = FilterTableAfterPost
    BeforeDelete = FilterTableBeforeDelete
    AfterDelete = FilterTableAfterPost
    AfterScroll = FilterTableAfterScroll
    TableName = 'Filter'
    Left = 870
    Top = 641
  end
  object RegFilterMaskTable: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'RegisterFilterMask'
    Left = 870
    Top = 673
  end
  object TabSource: TDataSource
    DataSet = TabTable
    Left = 902
    Top = 673
  end
  object PageSource: TDataSource
    DataSet = PageTable
    Left = 902
    Top = 641
  end
  object LookupPageSource: TDataSource
    DataSet = LookupPageTable
    Left = 934
    Top = 673
  end
  object RegisterSource: TDataSource
    DataSet = RegisterTable
    Left = 934
    Top = 641
  end
  object FilterSource: TDataSource
    DataSet = FilterTable
    Left = 934
    Top = 577
  end
  object RegFilterMaskSource: TDataSource
    DataSet = RegFilterMaskTable
    Left = 934
    Top = 609
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'TDB'
    FileName = 'SVPEX.TDB'
    Filter = '*.TDB|*.TDB'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 998
    Top = 609
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'MDB'
    FileName = 'CHIPDATA.MDB'
    Filter = '*.MDB|*.MDB'
    Title = 'Choose MDB File ...'
    Left = 966
    Top = 673
  end
  object Query: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 774
    Top = 673
  end
  object popBit: TPopupMenu
    Left = 998
    Top = 577
    object NotUsed1: TMenuItem
      Caption = 'Not Used'
      OnClick = bitMenuClick
    end
    object ReadOnly1: TMenuItem
      Tag = 1
      Caption = 'Read Only'
      OnClick = bitMenuClick
    end
    object WriteOnly1: TMenuItem
      Tag = 2
      Caption = 'Write Only'
      OnClick = bitMenuClick
    end
    object ReadWrite1: TMenuItem
      Tag = 3
      Caption = 'ReadWrite'
      OnClick = bitMenuClick
    end
  end
  object FormPlacement1: TFormPlacement
    Left = 966
    Top = 609
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = 'MDB'
    Filter = '*.MDB|*.MDB'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 998
    Top = 641
  end
  object RegFilterMaskTable2: TADOTable
    AutoCalcFields = False
    Connection = ADOConnection2
    CursorType = ctStatic
    TableName = 'RegisterFilterMask'
    Left = 806
    Top = 609
  end
  object FilterTable2: TADOTable
    AutoCalcFields = False
    Connection = ADOConnection2
    CursorType = ctStatic
    TableName = 'Filter'
    Left = 870
    Top = 577
  end
  object RegisterTable2: TADOTable
    Connection = ADOConnection2
    CursorType = ctStatic
    TableName = 'Register'
    Left = 870
    Top = 609
    object AutoIncField1: TAutoIncField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
    end
    object WideStringField1: TWideStringField
      DisplayWidth = 255
      FieldName = 'RegName'
      Size = 255
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Page'
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'RegAddress'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object MemoField1: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
    end
    object IntegerField3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DefaultVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object WordField1: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit0Right'
    end
    object WordField2: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit1Right'
    end
    object WordField3: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit2Right'
    end
    object WordField4: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit3Right'
    end
    object WordField5: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit4Right'
    end
    object WordField6: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit5Right'
    end
    object WordField7: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit6Right'
    end
    object WordField8: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit7Right'
    end
    object WordField9: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit8Right'
    end
    object WordField10: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit9Right'
    end
    object WordField11: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit10Right'
    end
    object WordField12: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit11Right'
    end
    object WordField13: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit12Right'
    end
    object WordField14: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit13Right'
    end
    object WordField15: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit14Right'
    end
    object WordField16: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit15Right'
    end
    object WordField17: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit16Right'
    end
    object WordField18: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit17Right'
    end
    object WordField19: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit18Right'
    end
    object WordField20: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit19Right'
    end
    object WordField21: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit20Right'
    end
    object WordField22: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit21Right'
    end
    object WordField23: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit22Right'
    end
    object WordField24: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit23Right'
    end
    object WordField25: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit24Right'
    end
    object WordField26: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit25Right'
    end
    object WordField27: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit26Right'
    end
    object WordField28: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit27Right'
    end
    object WordField29: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit28Right'
    end
    object WordField30: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit29Right'
    end
    object WordField31: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit30Right'
    end
    object WordField32: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit31Right'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Flag'
    end
  end
  object PageTable2: TADOTable
    AutoCalcFields = False
    Connection = ADOConnection2
    CursorType = ctStatic
    Filtered = True
    TableName = 'Page'
    Left = 838
    Top = 673
    object AutoIncField2: TAutoIncField
      FieldName = 'ID'
    end
    object WordField33: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'PageType'
      MaxValue = 10
    end
    object WordField34: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'PageRegVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField35: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField36: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowRegVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField37: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowRegMask'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField38: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'IndexReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField39: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'DataReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField40: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'RegAddressSize'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 4
      MinValue = 1
    end
    object WordField41: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'RegDataSize'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 4
      MinValue = 1
    end
    object WideStringField2: TWideStringField
      FieldName = 'Caption'
      Required = True
      Size = 50
    end
    object IntegerField5: TIntegerField
      FieldName = 'Tab'
    end
    object IntegerField6: TIntegerField
      FieldName = 'Tag'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object WideStringField3: TWideStringField
      FieldName = 'Name'
      Required = True
      Size = 32
    end
    object WordField42: TWordField
      FieldName = 'SlaveAddr'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
  end
  object TabTable2: TADOTable
    AutoCalcFields = False
    Connection = ADOConnection2
    CursorType = ctStatic
    TableName = 'Tab'
    Left = 838
    Top = 609
  end
  object ADOConnection2: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=E:\KV' +
      'Tool\Bin\Blank.mdb;Mode=Share Deny None;Extended Properties="";P' +
      'ersist Security Info=False;Jet OLEDB:System database="";Jet OLED' +
      'B:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engi' +
      'ne Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Par' +
      'tial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:N' +
      'ew Database Password="";Jet OLEDB:Create System Database=False;J' +
      'et OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on C' +
      'ompact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet ' +
      'OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 774
    Top = 577
  end
  object ImageList1: TImageList
    Left = 966
    Top = 641
    Bitmap = {
      494C010177007C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000F0010000010020000000000000F0
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0000000000000000000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF0084848400FFFFFF0084848400000000000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00848484008484840084848400000000000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00848484008484840084848400000000000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF0084848400FFFFFF0084848400000000000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000084
      8400008484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0000000000000000000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF00000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      00000084840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFF
      FF00848484000000000000000000000000000000000000FFFF00000000000000
      00000000000000000000000000000000000000000000848484008484840000FF
      000000FF000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      00000084840000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF00000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00848484008484840000FF
      000000FF00000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400000000000000000000000000000000000000
      000000000000000000008484840000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF00000000000000000000000000000000000000000000FFFF000000
      0000000000008484840084848400848484008484840084848400848484008484
      840084848400FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000FFFF000000000000FF
      FF0084848400FFFFFF0084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF000000000000FFFF0000000000000000000000000000FFFF000000
      000000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840084848400000000000000000000000000000000000000
      000000000000000000008484840084848400848484008484840000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000000000000000000000008484840000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF0000FFFF0000FFFF0084848400848484008484840084848400848484008484
      8400FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      000000000000000000008484840000FFFF00FFFFFF0000FFFF00848484008484
      840084848400848484008484840000000000000000000000000084848400FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000848484000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000000000000000
      0000848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      00000000000000000000000000000000000084848400000000008484840000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF0084848400FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00848484008484
      84008484840000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF0084848400FFFF
      FF0000FFFF008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF008484
      840084848400FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400848484008484840000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000C6C6
      C6000000000000000000848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000000000FFFF0000FFFF0000FFFF
      FF00FFFF0000FF000000000000008484840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00008484
      8400FF000000FFFF0000FF0000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00848484008484
      8400848484008484840084848400FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF000084848400C6C6
      C60084848400FF000000FFFF00000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400FFFF0000FFFF
      FF00FFFF00008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484008484
      8400848484008484840084848400FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000000000000000000000000000FFFFFF00000000008400
      0000840000008400000084000000840000008400000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      FF00000084000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400848484008484840000000000FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00000000008484840000000000FFFF
      FF0000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000084000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      000000000000000000000000000084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      000000000000000000000000000084848400C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF0000000000FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00848484008484840000000000FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF000000FF000000
      FF000000FF000000FF000000FF00000084000000000000000000000000000000
      00008400000084000000000000000000000000000000FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000000000000000000000000000
      0000840000008400000000000000000000000000000084000000000000000000
      000084000000000000000000000084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000000000000000000000000000
      00008400000084000000000000000000000000000000FFFFFF000000FF000000
      FF000000FF000000FF000000FF00000084000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000840000000000
      000084000000840000000000000084848400C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000FFFFFF000000
      FF000000FF000000FF000000FF00000000000000000000000000840000008400
      00008400000084000000840000008400000000000000FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000000000000000840000008400
      0000840000008400000084000000840000000000000000000000000000008400
      0000840000008400000084000000848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000840000008400
      0000840000008400000084000000840000000000000000000000FFFFFF000000
      FF000000FF000000FF000000FF00000000000000000000000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      000084000000840000000000000084848400FFFFFF0084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000008484
      8400840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000840000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000840000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000008484
      8400FFFFFF008400000084000000840000008400000084000000840000008400
      0000FFFFFF0084000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000084840000FFFF000084840000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000084
      840000FFFF000084840000FFFF00FFFFFF0000000000FFFFFF0000FFFF000084
      840000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000084
      840000FFFF00FFFFFF0000FFFF0000000000000000000000000000FFFF00FFFF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      000084848400FFFFFF0084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF000000000000000000C6C6C600FFFFFF000000
      0000FFFFFF008484840084848400848484008484840084848400848484008484
      8400FFFFFF00C6C6C6008484840000000000000000000000000000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000C6C6C600000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000C6C6C60000000000FFFF
      FF00000000000000000084848400848484008484840084848400848484008484
      8400FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000008400000084000000848484008484840084848400840000008400
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000008400000084000000000000000000
      00008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000848484008484840084848400FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      000084848400FFFFFF0084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF000000000000000000C6C6C600FFFFFF000000
      0000FFFFFF008484840084848400848484008484840084848400848484008484
      8400FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0084848400848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C60000000000FFFF
      FF00000000000000000084848400848484008484840084848400848484008484
      8400FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484008484840084848400FFFFFF008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      84000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000084848400C6C6C6000000
      0000848484008484840084848400848484008484840084848400848484008484
      840084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF008484840084848400848484008484840084848400848484008484
      8400FFFFFF00C6C6C60084848400000000000000000084848400FFFFFF000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000084848400C6C6C6000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF008484840084848400848484008484840084848400848484008484
      8400FFFFFF00C6C6C60084848400000000000000000084848400FFFFFF000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000084848400C6C6C6000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400FFFFFF000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF008484840084848400848484008484840084848400848484008484
      8400FFFFFF00C6C6C60084848400000000000000000084848400FFFFFF000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400C6C6C60000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000084848400C6C6C6000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF008484840084848400848484008484840084848400848484008484
      8400FFFFFF00C6C6C60084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF008484840084848400848484008484840084848400FFFFFF008484
      8400848484008484840084848400000000000000000084848400840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF008484840000000000000000000000000084848400FFFFFF008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF0084000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C60000000000C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000008400
      0000FF00000084000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0084000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000000000000000000000000084848400FFFF
      FF0084000000840000008400000084000000C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000000000000000000000000000C6C6C60084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000008484840000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF008484000084840000848400008484000084840000848400008484
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000000000000000000000000000C6C6C6008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600FFFFFF00C6C6C600000000000000000084848400FFFFFF0084848400FFFF
      FF0084000000840000008400000084000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      000084000000000000000000000000000000C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000008484840000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF008484000084840000848400008484000084840000848400008484
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF0084000000000000000000000000000000C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000000000000084848400FFFFFF0084848400FFFF
      FF0084000000840000008400000084000000C6C6C600C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600C6C6C60000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      000084000000000000000000000000000000C6C6C6008484840000000000FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000008484840000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF008484000084840000848400008484000084840000848400008484
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF0084000000000000000000000000000000C6C6C6008484840000000000FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000000000000084848400FFFFFF00848484008484
      84008484840084848400848484008484840084848400C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600C6C6C60000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000000000000000000000000000C6C6C6008484840000000000FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0084848400C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF008484000084840000848400008484000084840000848400008484
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600C6C6C60000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C6000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF008484000084840000848400008484000084840000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C60000000000000000000000000000000000848484008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000C6C6C60000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6
      C600FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400C6C6C60000000000000000000000000000000000848484008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000840000000000
      0000840000008400000000000000840000008400000000000000840000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000FF000000FF000000FF000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000084000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000008400000084000000000000008400000084000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000FFFF000000000000000000FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000008484
      840000000000000000000000FF00000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000008484
      8400000000000000FF000000FF000000FF000000000000000000840000000000
      0000000000000000000000FF0000000000000000000000000000000000000000
      0000000000008484840084000000848484000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000008484
      840000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000FF000000FF00000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF0000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000008484
      840000000000000000000000FF00000000000000000000000000840000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000000000FFFFFF00000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000008484
      840000000000000000000000FF00000000000000000084000000840000008400
      0000000000000000000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000008400000084000000000000008400000084000000000000008484
      8400000000000000000000000000000000000000000084848400840000008484
      8400000000000000000000FF0000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000008400000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000084000000000000008400
      0000000000008400000084000000000000008400000084000000000000008400
      0000840000000000000084000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FF000000FF00000000000000000000000000
      000000000000FF00000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000008484840084848400FF000000FF000000000000000000
      0000FF000000FF00000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000084848400848484008484840000000000FF000000FF00
      0000FF0000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FF000000FF0000000000
      0000FF000000FF00000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000008484840084848400848484008484840000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FF000000000000000000
      000000000000FF000000FF000000000000000000000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000848484008484840084848400000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000084000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      0000848484000000000084848400000000008400000084000000840000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000000000000000000000848484008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      000084000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      000000FF00000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600840000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      00000000000000FF000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000FF000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      000000FF00000000000000FF0000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000FF000000FF00
      000084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600840000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      00000000000000FF000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000FF000000FFFF
      FF0084000000C6C6C60084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      000000FF00000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FFFF
      FF00840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      00000000000000000000000000000000000000000000C6C6C60000FFFF000000
      000000FFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF00C6C6C60000FFFF00C6C6C600000000000000000000FFFF00000000000000
      0000000000000000000000000000000000008400000084000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000FFFF00C6C6
      C60000FFFF008400000000FFFF000000000000000000C6C6C600000000000000
      00000000000000000000000000000000000084000000C6C6C600FF000000C6C6
      C600FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000840000008400000084000000840000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C6C6C60000FF
      FF008400000000FFFF00C6C6C600000000000000000000FFFF00000000000000
      00000000000000000000000000000000000084000000FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000FFFF008400
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C600000000000000
      00000000000000000000000000000000000084000000C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C6008400000000000000000000000000
      0000840000008400000084000000848484000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084000000FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF008400000000000000000000000000
      0000840000000000000000000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000FFFF008484
      8400000000000000000000000000000000000000000000000000848484000000
      00000000000000000000000000000000000084000000C6C6C600840000008400
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000084848400840000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484000000
      0000848484008484840084848400000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00848484000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400848484008484840084848400C6C6C600848484008484
      84008484840084848400C6C6C600848484000000000000000000000000000000
      000084848400FFFFFF008484840000000000FF000000FF000000FF0000000000
      000084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      000084848400FFFFFF0000000000FF000000FFFFFF00FF000000FF000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000008484840084848400000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      000084848400FFFFFF0000000000FFFFFF00FF000000FF000000FF000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000084848400000000008484
      8400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000008484840000000000000000000000
      000084848400FFFFFF008484840000000000FFFFFF00FF000000FF0000000000
      000084848400FFFFFF00000000000000000000000000FF000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF000000
      00000000000000000000C6C6C6000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF000000000000000000C6C6C600FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00848484000000000000000000000000008484
      8400FFFFFF00FFFFFF00000000000000000000000000FF000000FF000000FF00
      00000000000000FFFF0000FFFF0000FFFF000000000000000000840000008400
      0000000000000000000084000000840000000000000000000000FFFFFF000000
      00000000000000000000C6C6C6000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FF000000FF000000FF00
      00000000000000FFFF0000FFFF0000FFFF000000000000000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000084848400000000008484
      8400C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFFFF008484
      8400848484008484840000000000000000000000000000000000FF000000FF00
      00000000000000FFFF0000FFFF00000000000000000000000000000000008400
      000084000000840000008400000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      000084848400C6C6C60000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084000000840000008400000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000840000000000FF000000
      FF000000FF000000FF000000000000000000000000000000FF00FFFFFF000000
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000008484840000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000840000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000FF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000848484000000
      000084848400C6C6C60000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008400000084000000840000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00FFFFFF000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00C6C6C600FFFFFF00840000008400000084000000840000008400
      0000FFFFFF00C6C6C60000000000000000000000000084848400000000008484
      8400C6C6C6000000000000000000FFFFFF008484000000000000000000008484
      8400000000000000000084848400000000000000000000000000000000000000
      00000000000084848400000000000000000000000000848484000000FF000000
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      00000000FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000848484000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C6000000000000000000000000008484840000000000C6C6
      C600848484000000000084848400FFFFFF008484000084840000848400000000
      0000848484008484840000000000848484000000000000000000000000000000
      00008484840000000000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF00FFFFFF00C6C6C600FFFFFF00000000008484840000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF008400000084000000840000008400000084000000840000008400
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000008484
      84000000000084848400FFFFFF0084840000FFFF0000FFFF0000848400008484
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C6000000000000000000000000008484840000FF
      FF0000000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF000000000000FF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000000000000000
      000000000000FFFFFF0084840000FFFF00008484000084840000FFFF0000FFFF
      0000848400008484000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF000000000000000000FFFFFF00000000008484
      840000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000008484
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00C6C6C600FFFFFF00840000008400000084000000840000008400
      0000FFFFFF00C6C6C6000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFF0000FFFFFF00FFFF000084840000FFFF0000848400008484
      0000FFFF0000FFFF000000000000848484000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400848484008484840084848400848484000000000000FFFF000000000000FF
      FF008484840000000000C6C6C600FFFFFF00C6C6C600000000008484840000FF
      FF0084848400000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000000000000000
      000000000000FFFF000084848400FFFFFF00FFFFFF00FFFF000084840000FFFF
      000084840000FFFF000000000000848484000000000000000000000000000000
      00000000FF000000000000000000FFFFFF00FFFFFF0000000000848484000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      000000FFFF00848484000000000000000000000000008484840000FFFF008484
      840000FFFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00C6C6C600FFFFFF00840000008400000084000000840000008400
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      000000000000FFFF0000848484008484840084848400FFFFFF00FFFF0000FFFF
      0000FFFF00000000000084848400FFFFFF000000000000000000000000000000
      FF00FFFFFF000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF000000
      00008484840000FFFF008484840000FFFF008484840000FFFF008484840000FF
      FF008484840000FFFF000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000000000000000
      000000000000FFFF00008484840000000000000000000000000000000000FFFF
      0000000000008484840084848400FFFFFF0000000000000000000000FF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF000000000000000000000000008484840000FFFF008484840000FFFF008484
      840000FFFF00848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF008400000084000000840000008400000084000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000084848400000000000000000000000000000000000000
      00008484840084848400FFFFFF0000000000000000000000FF00FFFFFF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6
      C600FFFFFF008484840000000000000000000000000000000000000000000000
      000000000000FFFF000084848400000000000000000000000000848484000000
      000084848400FFFFFF00000000000000000000000000FFFFFF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      000000000000FFFF00008484840000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000000000
      0000840000008400000000000000000000000000000000000000000000000000
      00000000000000000000000000000084840000FFFF0000848400000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000084840000FFFF000084840000FFFF000084840000FFFF000084
      840000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF00000084000000FF000000
      84000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000008400000084000000000000000000000000000000000000000084
      840000FFFF000084840000FFFF00FFFFFF0000000000FFFFFF0000FFFF000084
      840000FFFF00008484000000000000000000000000000000000000000000C6C6
      C600C6C6C60000000000C6C6C600C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      000000000000840000008400000000000000000000000000000000FFFF000084
      840000FFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000FFFF000084840000FFFF0000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      000000000000840000008400000000000000000000000000000000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000FF0000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008400000084000000000000000000000000000000840000008400
      000000000000000000000000000084848400000000000000000000000000C6C6
      C600C6C6C60000000000C6C6C600C6C6C60000000000C6C6C600000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000FF0000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008400
      0000840000000000000000000000848484008484840084848400000000000000
      000084000000840000000000000084848400000000000000000000000000C6C6
      C6000000000000000000C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000840000008400000000000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFF0000FFFF0000848484008484840084848400FFFF0000FFFF
      000000000000000000008484840000000000000000000000000000000000C6C6
      C600C6C6C60000000000C6C6C600C6C6C60000000000C6C6C600000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000008400
      0000840000000000000000000000000000008400000084000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFFFF00FFFFFF008484840000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF0084000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6008400000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00C6C6C60000FFFF0000000000000000000000
      000000FFFF00C6C6C6000000000000000000000000008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600FFFFFF008484840000000000000000000000
      00000000000000000000C6C6C600C6C6C6008400000084000000000000000000
      0000FFFFFF0084848400848484008484840084848400FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000848484000000
      000000000000FFFFFF00C6C6C60000FFFF00C6C6C60000FFFF000000000000FF
      FF00C6C6C60000FFFF000000000000000000000000008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600FFFFFF008484840000000000848484000000
      0000000000000000000000000000848484008400000084000000840000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084000000840000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000FFFF00C6C6C60000FFFF00C6C6C60000000000C6C6
      C60000FFFF00C6C6C6000000000000000000000000008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600FFFFFF008484840000000000000000008484
      8400000000000000000084848400000000008400000084000000840000000000
      00000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      000084000000840000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00C6C6C60000FFFF00C6C6C600000000000000000000FF
      FF00C6C6C60000FFFF000000000000000000000000008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      000000000000840000000000000000000000848484000000000000000000FFFF
      FF0000000000FFFFFF0000FFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000FFFFFF008484840084848400FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000FFFF0000000000000000000000000000FFFF00C6C6C60000FFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000084000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000FFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF000000FF000000
      FF000000FF000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000084848400000000000000
      000084848400000000000000000000000000FFFFFF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C6000000
      00000000000000000000C6C6C60000FFFF00C6C6C60000FFFF00000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      000000000000848484000000000000000000FFFFFF000000FF000000FF000000
      FF000000FF000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000008484
      8400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000008484840000000000000000008484
      8400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFF00008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF000000000084848400FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00000000008400000084000000000000000000
      000084848400FFFFFF0084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000084848400FFFF0000FFFFFF008484
      8400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000000000000000000000000000084848400FFFF000000000000000000000000
      00000000000000000000FFFF0000000000008400000084000000840000000000
      000084848400FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFF00008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000084848400000000000000000084848400FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00000000008400000084000000840000000000
      000084848400FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000084848400FFFF0000FFFFFF008484
      8400FFFFFF00C6C6C600FFFFFF00C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00C6C6C60084848400FFFF000000000000000000000000
      00000000000000000000FFFF0000000000008400000084000000000000000000
      000084848400FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFF00008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF0084848400FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00000000008400000000000000000000000000
      000084848400FFFFFF0084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFF0000FFFFFF008484
      8400848484008484840084848400848484008484840000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000084848400FFFFFF00C6C6C60084848400FFFF0000FFFFFF00FFFF0000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFF0000FFFF
      FF00FFFF000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF0084848400FFFFFF00FFFF0000FFFFFF00FFFF
      000000000000C6C6C60000000000000000000000000000000000000000000000
      000084848400FFFFFF0084848400848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFF0000FFFFFF00FFFF
      0000FFFFFF0000000000000000000000000000000000000000000000FF000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      000084848400FFFFFF00C6C6C60084848400FFFF0000FFFFFF00FFFF0000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840084848400000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF00848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00C6C6C600FFFFFF00C6C6C60000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF00C6C6C600FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFFFF00000000000000000000FF
      FF00FFFFFF00000000000000000000FFFF000000000000000000000000000000
      000000000000FFFFFF0084000000FFFFFF0084000000FFFFFF00848484000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000FFFFFF00C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00848484000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00848484000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00848484000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00848484000000
      0000000000000000FF000000FF00000000008484840000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008400000000000000000000000000
      000000000000FFFFFF0084000000FFFFFF0084000000FFFFFF00848484000000
      0000000000000000FF000000FF000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400000084000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000FF000000FF000000FF0000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008400000084000000840000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000FF000000FF000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      000000000000000000008484840000FFFF000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000000000000848484000000000000000000C6C6C60000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000008484
      84000000000000000000FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000084848400840000008400000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000FFFFFF000000
      00000000000000000000C6C6C60000FFFF000000000084848400FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00C6C6C600000000000000000084848400000000000000
      0000FFFF00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000
      FF00FFFF00000000000000000000848484000000000000000000000000000000
      0000000000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF000000000084848400FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00C6C6C600000000000000000000000000FFFF0000FFFF
      0000FFFF00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000
      FF00FF000000FFFF0000FF000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084848400000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00008484840000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      000000000000000000008484840000FFFF000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000FFFF0000FFFF
      0000FFFF00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000
      FF00FFFF0000FF000000FFFF0000000000000000000000000000000000000000
      0000000000000000000084848400840000008400000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00C6C6C600000000000000000000000000FFFF0000FFFF
      0000FFFF00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000
      FF00FF000000FFFF0000FF000000000000000000000000000000000000000000
      0000000000000000000084848400840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000084848400FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00C6C6C600000000000000000000000000FFFF0000FFFF
      0000FFFF00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000
      FF00FFFF0000FF000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000848484008400000084000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000FFFF0000FFFF
      0000FFFF00000000FF008484840084848400FFFFFF0084848400848484000000
      FF00FF000000FFFF0000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000084848400FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00C6C6C600000000000000000000000000FFFF0000FFFF
      0000848484000000FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000
      FF0084848400FF000000FFFF0000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00C6C6C600000000000000000000000000848484008484
      8400FFFFFF00FFFF00000000FF00FFFF0000FFFFFF00FFFF00000000FF00FFFF
      0000FFFFFF008484840084848400000000000000000000000000000000000000
      0000000000000000000084848400840000008400000084000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000FF000000FF000000FF0000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF00000000FF000000FF000000FF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000084848400000000000000
      0000FFFFFF00FFFF00000000FF00FFFFFF00FFFF0000FFFFFF000000FF00FFFF
      0000FFFFFF000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000848484008400000084000000848484000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF0084000000FFFFFF00000000000000000000000000000000008484
      84000000000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      000000000000848484000000000000000000FFFF000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008400000084000000848484000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0084000000840000008400000084000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C6000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000848484000000000084848400000000008484840000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      84008484840000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000848484000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00000000000000000084848400FFFFFF0084848400FFFF
      FF0084000000840000008400000084000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF0000000000FFFFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000848484008484840000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF00000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000FF000000FF000000000000000000FFFFFF0000FFFF000000
      000000FFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000000084848400FFFFFF0084848400FFFF
      FF0084000000840000008400000084000000C6C6C600C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600C6C6C600000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF00000000000000000000000000000000008400
      0000FFFF0000FFFF00000000FF00FFFF0000FFFF000084000000000000000000
      0000000000000000FF000000FF000000000000000000FFFFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      840084848400FFFFFF00FFFFFF00000000000000000000000000000000008400
      0000FFFF0000FFFF00000000FF00FFFF0000FFFF000084000000000000000000
      0000000000000000FF000000FF00000000008484840000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00848484008484
      84008484840084848400848484008484840084848400C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFF
      FF000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000008400
      0000FFFF0000FFFF00000000FF00FFFF0000FFFF000084000000000000000000
      FF000000FF000000FF0084848400000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0084848400C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000000000000000000008400
      0000FFFF0000FFFF00000000FF00FFFF0000FFFF000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000848484008400
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000008484840084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      000000000000848484000000000000000000C6C6C60000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      00000000000000FFFF00FF000000FF000000FF000000FF000000FF00000000FF
      FF00FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00848484000000000000000000000000008484
      84000000000000000000FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000084848400000000000000
      0000FFFF00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000
      FF00FFFF00000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FF000000FF000000FF000000FF000000FF00000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000084848400FFFFFF000000FF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000000000000FFFF0000FFFF
      0000FFFF00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000
      FF00FF000000FFFF0000FF00000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000000000000FFFF0000FFFF
      0000FFFF00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000
      FF00FFFF0000FF000000FFFF000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000000000000FFFF0000FFFF
      0000FFFF00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000
      FF00FF000000FFFF0000FF00000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000084848400FFFFFF000000FF000000FF000000FF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000000000000FFFF0000FFFF
      0000FFFF00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000
      FF00FFFF0000FF000000FFFF000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000000000000FFFF0000FFFF
      0000FFFF00000000FF008484840084848400FFFFFF0084848400848484000000
      00000000000000000000FF00000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF000000FF00FFFFFF000000
      FF00FFFFFF0084848400FFFFFF00848484000000000000000000FFFF0000FFFF
      0000848484000000FF00FFFF0000FFFFFF00FFFF0000FFFFFF008484840000FF
      000000FF000000000000FFFF000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000FF000000FF000000FF0000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000FF00C6C6
      C600FFFFFF008484840084848400848484000000000000000000848484008484
      8400FFFFFF00FFFF00000000FF00FFFF0000FFFFFF00848484008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF00000000FF008484840000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000008484840000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000FFFFFF008484840084848400848484008484
      8400848484008484840000000000000000000000000084848400000000000000
      0000FFFFFF00FFFF00000000FF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000FFFFFF00FFFF000084848400848484008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484000000000000000000FFFF0000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      00000000000000FFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000FFFF0084848400C6C6C600FFFFFF00C6C6
      C60000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF0084848400FFFFFF00C6C6C6000000
      00000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      00000000000000000000000000000000000084848400C6C6C600FFFFFF000000
      0000FFFFFF000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600FFFFFF00C6C6
      C60000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF00C6C6C6000000
      00000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600FFFFFF000000
      0000FFFFFF000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000848484000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000848484000000FF000000FF000000FF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000FF000000FF000000FF0000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000084848400FFFFFF000000FF000000FF000000FF0000000000FFFFFF000000
      000000000000000000000000000000FFFF0084848400C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF0084000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0084000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      FF00FF000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00848484000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF0084848400FFFFFF008484840000000000000000000000000084848400FFFF
      FF008484840084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6008484840084848400C6C6C600000000000000000000000000000000008484
      840000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00848484008484840084848400000000000000000084848400FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF00000000000000000000000000000000008484
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00848484008484840084848400000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFF0000FFFF0000FFFF00000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF0084848400FFFFFF008484840000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF00000000000000000084000000C6C6C6008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000008484
      840000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000008484840000000000FFFFFF00FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      000000000000000000000000000000000000848484000000000084848400FFFF
      FF00848484000000000000000000000000008400000084000000840000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF0084840000FFFF
      0000FFFF0000FFFF000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000840000008400
      0000000000000000000000000000848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484000084840000FFFF
      0000FFFF0000FFFF000084848400FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000FFFFFF00FFFF
      0000FFFF0000FFFF000084848400848484008484840084848400848484000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848400008484
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000848484000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000008484840000000000848400008484
      0000FFFFFF00FFFF0000FFFF0000FFFF00000000000084848400000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000008484840000000000FFFF
      FF00848400008484000000000000000000008484840000000000000000000000
      0000000000000000000084848400000000008484840000FFFF00FFFFFF0000FF
      FF00848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000084000000FF00000084000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      00000000000000000000C6C6C600C6C6C600C6C6C6000000000000000000C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00C6C6C6000000000000000000FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00C6C6C6000000000000000000C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF0084848400000000000000000000FF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00000000000000
      00000000000084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF0084848400848484008484840000FF
      FF00FFFFFF008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000008484840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000FF000000FF000000FF0000000000FFFFFF0000FF
      FF00FFFFFF0084848400848484008484840000000000FFFFFF00C6C6C6000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      000084000000840000008400000084000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484000000000000000000000000008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000848484000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000FF0000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000848484000000000000000000840000008400000084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000848484000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FF0000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084848400840000008400
      0000848484000000000000000000840000008484840084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000848484000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000FF0000C6C6C60000FF0000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000008484840084000000848484008400
      0000848484000000000000000000848484008400000084848400840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000848484000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000000000000000000000
      0000000000000000000000000000000000008400000084848400840000008400
      0000848484000000000000000000840000008484840084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000848484000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C600000000000000
      0000000000000000000000000000000000008484840084000000848484008400
      0000848484000000000000000000848484008400000084848400840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000848484000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C6000000
      0000000000000000000000000000000000008400000084848400840000008400
      0000848484000000000000000000840000008484840084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C600000000000000000000000000000000008484840084000000848484008400
      0000848484000000000000000000848484008400000084848400840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C6000000
      0000000000000000000000000000000000008400000084848400840000008400
      0000848484000000000000000000840000008484840084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C600000000000000
      0000000000000000000000000000000000008484840084000000848484008400
      0000848484000000000000000000848484008400000084848400840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000000000000000000000
      0000000000000000000000000000000000008400000084848400840000008400
      0000848484000000000000000000840000008484840084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000C6C6C60000FF0000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000008484840084000000848484008400
      0000848484000000000000000000848484008400000084848400840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FF0000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084848400840000008400
      0000848484000000000000000000840000008484840084000000840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084000000848484008400
      0000848484000000000000000000848484008400000084848400840000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084848400840000008400
      0000000000000000000000000000840000008484840084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00C6C6
      C60000000000C6C6C600C6C6C600000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00C6C6
      C60000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6
      C600000000000000000000000000000000008484840000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00C6C6
      C60000000000FFFFFF00C6C6C600000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6
      C6000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00C6C6
      C60000000000FFFFFF00C6C6C600000000000000000084848400840000008400
      000084000000840000008400000084000000840000008400000000000000C6C6
      C60000000000C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00C6C6
      C60000000000FFFFFF00C6C6C600000000000000000084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C60000000000C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000000000000000
      000000000000FFFFFF00C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000008484
      8400840000008400000084000000840000008400000084000000840000008400
      000000000000C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000008484840084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00840000008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF0084000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084000000840000008400000084000000840000008400
      0000840000008400000000000000000000008484840084000000840000008400
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084008400840084848400000000000000
      000000000000000000000000000000000000C6C6C60084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000008400840084008400FFFFFF00FFFFFF00C6C6C600848484000000
      000000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      84000000000000000000000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000008400
      840084008400FFFFFF00FFFFFF000000000000000000C6C6C600C6C6C6008484
      840000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      840000848400008484000084840000000000848484008400840084008400FFFF
      FF00FFFFFF000000000000000000840084008400840000000000C6C6C600C6C6
      C60084848400000000000000000000000000FFFFFF00C6C6C6000000FF000000
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      84000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      84000084840000848400008484000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400000000008484840084008400FFFFFF000000
      000000000000840084008400840084008400840084008400840000000000C6C6
      C600C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000008400
      840084008400840084000084840000FFFF008400840084008400840084000000
      0000C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C6000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C600000000000000000000000000000000008484840084008400840084008400
      8400840084008400840084008400008484008400840084008400840084008400
      840000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000084008400FFFFFF008400
      84008400840084008400840084008400840000FFFF0000FFFF00840084008400
      8400840084000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000000000000000000000000000000000000000000084008400FFFF
      FF0084008400840084008400840084008400840084000084840000FFFF0000FF
      FF00840084008400840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000008400
      8400FFFFFF00840084008400840084008400008484008400840000FFFF0000FF
      FF00840084008400840084008400000000000000000000000000848484000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084008400FFFFFF00840084008400840000FFFF0000FFFF0000FFFF008400
      8400840084008400840000000000000000008484840000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000008400000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      00000000000084008400FFFFFF00840084008400840084008400840084008400
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      000000FF00000000000000000000000000000000000000000000848484008484
      840084848400848484008484840084848400848484000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000084008400FFFFFF008400840084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000840084008400840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000008484000084
      840000000000000000000000000000000000C6C6C60000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000008484000084
      840000000000000000000000000000000000C6C6C60000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000840000008400
      000084000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF008484840000000000840000000000000000000000000000000000
      00000000840000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000008484000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600FFFFFF008484840084000000840000008400
      0000000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600FFFFFF0084848400000000000000000000000000000000000000
      84000000840000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400C6C6C600C6C6
      C60000000000C6C6C60000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      000000848400000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF0084848400000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000848400008484000000
      0000008484000000000000848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      84000000840000000000000000000000840000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000C6C6C600000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000008484000000
      00000084840000000000008484000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000084000000000000000000000084000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000008484000000
      00000084840000000000008484000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000008400000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C600000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      00000084840000000000008484000000000000000000C6C6C600FFFFFF00FFFF
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C6000000
      00000084840000000000008484000000000000000000C6C6C600FFFFFF00FFFF
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      0000000084000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000FFFFFF00FFFF
      FF00FFFF0000FFFF0000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600000000000084840000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600FFFF00008484
      84008484840000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000084840000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6C600C6C6C6008484
      8400C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000C6C6C6008484
      84008484840000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000000000000000000000000000000000000FFFFFF0000000000C6C6
      C60000000000FFFFFF0000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6C600C6C6
      C600C6C6C6000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000008400000084000000840000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084000000840000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000008400000084000000840000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084000000840000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000008400000084000000840000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000F00100000100010000000000800F00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFF18010000000180011FFF0000FFFFFFFF1FFF0000C003E001FFFF0000
      000180011FFF0000FFFFFFFF18010000E00FE0011FFF0000FFFFFFFF1FFF0000
      FFFFFFFFFFFF0000C003E0011FFF0000FFFFFFFF18010000000180011FFF0000
      C007E001FFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFC007FFFFC01F83FFFFFF8001F1CFC3FFFFFFFFFFF1C7E3FFF83F8007
      F1C7F8FFE3CF8001F1C7FC7FE3CFFFFFF00FFC3FE3CF8007F1C7FE3FE3CFFFFF
      F1C7FF8FE3CFFFFFF1C7FFC7E3CF8007F1CFFFC3E3CFFFFFC01FFFC1E3CF8001
      FFFFFFFFC1078007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C07FE000FFFFF701
      953FE000FFFF03012A9FE000F3D70200555FE000F3D776002A9FE000F3F77E00
      555FE001F007FF012A83FFFFF3E70001554380FBF41700C700010071F41700FF
      00000060F41F00FF0000007BF41700FF80010073FFFF00FFC0430003FFFF00FF
      FFE70083FFFF01FFFFFF8FFFFFFF03FFFFFFFC00EDB6FFFFC07FFC00EAAAFFFB
      9531FC00EAAAFAAF2000FC00EDB6FD575000FC00FFFFFAAB2001FC00C01FF555
      5000FC00C01FF7FF2000FC01C019F0035551FE3F0010F003001FFFF30019F00F
      001FFFE10019F1FF001F00730039F1FF803F3F730061FFFFC07F3947007FFFFF
      FFFF007F00FFFFFFFFFF007F9FFFFFFFF445FFC7FFFF803FF555FF01801FFFBF
      F555FE00801F80BFF555FE00801F80BFF445FE00801F80BFFFFFFE00FFFF8080
      E3FFFF01A05F809480FFE383FFF080AA80FF80EFBE008094007F80FFBE00802A
      00730073B600809400730073D200FF2A80C00040E000E00080C080C0F200E000
      E3F380F3F600E000FFF3E3F3FFFFE000AC00F000FFFFF80F07FFF0008001E003
      AFFFF0008001C00107FF70008001C001AFFF30008001C001FFFF10008001C001
      C7C710008001C001C7C730008001E003C38770008001B80FC007F00080011E3F
      C007F00080014FFFC007F0008001E7FFC007F0018001BFFFC007F00380031FFF
      F39FF00780074FFFF39FFFFF800FE7FFFFFFFFFFB6E7FFFFC0018001B76BFE49
      C00180018427FE49C0018001B76BFFFFC0018001CEE7FFFFC0018001FFFFC7C7
      C0018001C7C7C7C7C0018001C7C7C387C0018001C387C007C0018001C007C007
      C0018001C007C007C0018001C007C007C0018001C007C007C0038001C007F39F
      C0078001F39FF39FC00FFFFFF39FF39FFFC8FFFFFFFFFFFFFFEBFFFFC03FC001
      0380FFFFC03FC001E0870003003FC001E00700030000C001E00700030000C001
      E00700030000C001E00700030000C001E00700030000C001E00700030000C001
      E00700030000C001FFFF00030000C001F81F0003C000C001F81F0003C000C003
      F81F0003C000C007FFFF0003C000C00FFFFFE00FFFFFFFFF8001EFEFD251F00F
      8001EFE8DFF5F0088001E92FFBF1F00F8001EEEDD9FFF00D8001EEE8D8F8F008
      8001EEEDF878F00D8001EEEDD83DF00D8001EEEFD83DF00F8001EEED887FF00D
      8001E92F88FDD00F80016FEDF9FFCFFD8001200F8FFDC7FF80011FFDA925CFFD
      C0FF3FFF8FFFDFFFFFFF7FFFFFFFFFFFF000C07FFFFFFFFFF67A807F8001C001
      F432807FBFFDDFFDF486807FB24DD80DF7CE807FB24DDFFDF446807FBFFDC001
      F412807FB24DD861F7B880FFB24DDFE3F7FEEFFFBFFDC007F000FFFFA005FFFF
      83FFEFFFA005FE31E3FFFFDFA005F400C3FFF7CFA005ED8C8BFFFD47BFFDEC84
      1BFFFFCF8001E8003FFFFFDFFFFFF3F9FFFFFFFFFFFFFFD7F8F8F007F800FFEB
      F8F8F007FC00FFD5F870F007FBFCFFEAF800F007FAFCFFD5F800C007F80280EB
      F800C00781FFBED70000C007BDF3BE2F0000C01FBC71BE9F0013001F8173808F
      00130010811380AF00130011815380AF001F0070E053E02F001F0076E05FE02F
      001F007CF81FF80F8FFF007DF81FF80FFFFFF001FFF3FFFFFFFFF001FFF3FFFF
      FE11F001FFFF07C1F000F001FFF307C1EE00F001FFF307C1D001F001FFF10101
      900380013E780001B0030001007C0001B0032001004C0001A003F00100408003
      8FE780010061C107FFFF0003007FC107FFFF2007007FE38FFFFFF18F007FE38F
      FFFFF8FF007FE38FFFFFFDFFC1FFFFFFF83F9FFFFFFFFDFFF83F0FFFC001F0FF
      F80307FFC001E07FF80783FFC001C03FF800C03FC001800DF800E01FC0018000
      F000000FC0018000F0000007C0018000F0000007C001C000F0000003C001F800
      E01F0003C001F800C03F0001C001F98083FF0001C001F98107FF0003C003F9C3
      0FFF000FC007F9E79FFF000FC00FF9FFC001FFFFFFFFFE3FC001FFFFFF93F80F
      C001FF07F339E003C001FE03E7398000C0017C01E7398000C0013800E7398000
      C0011800C3938000C0010800E7FF8000C0011800FFFF8000C0013800F27FC001
      C0017C01E73FC001C001FE03E73FE003C001FF07E73FE003C001FFFFE73FF007
      C001FFFFF27FF007FFFFFFFFFFFFF80FFFFFF001E1C0E01FAAAAF001C0F0601F
      FFFFF0018070201FBFC2C0018040001FFFE3C00180610010BFC2C0018073201F
      FFCB0001C0FF6019803E0001E187E010803F0007FF03E039803E0007CE01E079
      803F00078601FFF9803E001F0201FFFF803F001FCE01FFF9802A001FCF03FFFF
      FFFF8FFFC387FFF9FFFFFFFFFFFFFFFFFFF9E00FFFFFF000FFF8E00FC3FFF000
      FFD1E00FE3FFF0004941000FC20070007FC0000F8A003000F0C1000FBE001000
      70C3000FB000100070C7001FF0003000F0CF003FF00070007FDF007DF000F000
      43FF00FDF001F000C3FF01D1F003F00043DF03C3F007F00143DFFFC7F00FF003
      FFFFFFC3F01FF007249FFFFFF03FFFFFF01FF000FFFFF800F01FF800FFFFF800
      F01FF000FFFFF800F010F000FFDDF800F01FF002FFCDF800F019FFFF8001F800
      F010FFF3FFCDF800F019FFE1FFDDF000F0190073BBFFF00070190073B3FFE000
      301F00738001E00010190043B3FFC07F101F007FBBFF81FF3FF9007FFFFF07FF
      7FFF007FFFFF0FFFFFF98FFFFFFF9FFF8000FE3FFFFFB0008000F80FFE1FB000
      8000E003FC5F800080008000FC7FB00080008000FC3F800080008000FC3FF800
      80008000FC3FF80080008000FE1FF00080008000FF1FF00080008000FD1FE000
      80008000FC1FE00080008000FFFFC07F80008000FE1F81FF8000E003FE1F07FF
      8000F80FFE1F0FFFFFFFFE3FFFFF9FFFEDB6FFFFFFFF8000EAAAFFFFC03F8000
      EAAAFFFFC03F8000EDB6FFFF003F8000FFFF83F100008000FFF903F100008000
      FFF0000000008000E039000000008000E039000000008000E03903FF00008000
      E02183FF00008000E03FFFFF00008000C03FFFFFC00080009FFFFFFFC0008001
      3FFFFFFFC00080037FFFFFFFC0008007FFFFF800FF00FE3FFFFFF800FF00F80F
      FCF9F800FC00E003FDFDF800FC008000BDFDF800FC0080009D55F800FC008000
      8DFDF800FC00800085FDF000FC0080008DFDF000FC0080009DFDE000FC008000
      BDFDE000FC008000FDFDC07FE0038000FCF981FFF0038000FFFF07FFE1FFE001
      FFFF0FFFC5FFF803FFFF9FFF0FFFFE27FFFFC003F800F8000001C003F800F800
      0001C003F800F8000001C003F800F8000001C003F800F8000001C003F800F800
      0001C003F800F8000001C003F000F0000001C003F000F0000001C003E000E000
      0001C003E000E0000001C003C07FC07F0001C00381FF81FF0001C00307FF07FF
      0001C0030FFF0FFFFFFFC0039FFF9FFFEDB6FFC7C000FFFFEAAAFF01C000CE01
      EAAAF701C000E601EDB60200C000E601FFFF0200C000CE01F07F7600C000FFFF
      C03F7F01C000C601801FFF018000CE01001F00471C0FF6010019007F4E1FCE01
      0010007FE7FFFFFF0019007FB3FFEE010019007F1FFFEE010039007F4FFFEE01
      806100FFE7FFEE01C1FF8FFFF3FFFFFFE0FFFFFFF800EDB6C07FFC01F800EAAA
      803FC801F800EAAA001FD801F800EDB6001FD801F800FFFF001FD001F800FFFF
      001FC7F3F800E01F001FFFFFF000E01F803FFFFFF000E01FC07FFFFFE0000019
      E0F3FFF3E0000010FFF3FFF3C07F0019FFC0FFC081FF0019FFC0FFC007FF00F9
      FFF3FFF30FFF00E1FFF3FFF39FFF00FFFFFFFFFFFC07F80FF3FF870FF807F00F
      F1FF060FF807F00FF0FF060FF807F00FF07F060FF807F00FF03F060FF807F00F
      F01F060FF807F00FF00F060FF80FF01FF00F060FFF7FFFFBF01F060FFE3FFFF1
      F03F060FFC1FFFE0F07F060FFFFFFFFFF0FF060FFEFF7FFBF1FF060FFFFFFFFF
      F3FF060FFDFFDFEFFFFF0E1F6FFFFB7F803FFFFFFC00FFFF803F801FEC00FFFF
      8007801FDC0000018007801FDC000001800080078C00000180008007DC000001
      8000800700000001800080010000000180008001000000018200800100010001
      8200E00100030001FE40E00100070001F040E001001E0001FFC9F801001A0001
      FE0BF80100110001FFFFF801001BFFFFFFFFFFFFFFFFFFFFFE3F0007C00FC00F
      F81F0007A007A007E00F0007900390038007000790019001000300078F018F01
      0001000F80FF80FF0000FFFF800F800F00013F01801F800F80013E00C007C00F
      C0013600C007C00FE0001200C001C07FF0000000C001C001F803F200C007C001
      FC0FF601FFC7FF81FE3FFF1FFFE7FFFFFFF3FFFFFFFFFFFFFFE9FF3FC007C00F
      FFD1FE3F8003800FFFA3C07F00018003F04780F700018003C00F00E700018000
      801F00C100008000801F00E600008000000F00F680008000000F81FEC0008000
      000FC3BFE0018000000FFFB7E0078000801FFFB3F007E000801FFFC1F003E000
      C03FFFF3F803F800F0FFFFF7FFFFF800FFFFFFFFFFFFFFFFC001000C000FF9FF
      80010008000FF9FF80010001000FF3C780010003000F73C780010003000F27FF
      80010003000F07C780010003000F00C780010003000F01E380010007000403F1
      8001000F000006388001000F00000E388001000FF8001E388001001FFC003F01
      8001003FFE047F83FFFF007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEFFDC007001FFFFFC7FFC007000FFFFFC3FBC0070007EFFFE3F7C0070003
      EF83F1E7C0070001DFC3F8CFC0070000DFE3FC1FC007001FDFD3FE3FC007001F
      EF3BFC1FC007001FF0FFF8CFC0078FF1FFFFE1E7C00FFFF9FFFFC3F3C01FFF75
      FFFFC7FDC03FFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00FFFF
      F6CFFE008000FFFFF6B7FE000000FFFFF6B7FE000000FFFFF8B780000000FFF7
      FE8F80000001C1F7FE3F80000003C3FBFF7F80000003C7FBFE3F80010003CBFB
      FEBF80030003DCF7FC9F80070003FF0FFDDF807F0003FFFFFDDF80FF8007FFFF
      FDDF81FFF87FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SaveDialog3: TSaveDialog
    Left = 998
    Top = 673
  end
  object dsCopyPageSource: TDataSource
    DataSet = tblCopyPageTable
    Left = 966
    Top = 577
  end
  object tblCopyPageTable: TADOTable
    AutoCalcFields = False
    Connection = conADOConnection3
    CursorType = ctStatic
    AfterInsert = PageTableAfterInsert
    AfterPost = PageTableAfterPost
    AfterCancel = FilterTableAfterScroll
    BeforeDelete = PageTableBeforeDelete
    AfterDelete = PageTableAfterPost
    AfterScroll = PageTableAfterScroll
    TableName = 'Page'
    Left = 806
    Top = 577
    object AutoIncField3: TAutoIncField
      FieldName = 'ID'
    end
    object WordField43: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'PageType'
    end
    object WordField44: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'PageRegVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField45: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField46: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowRegVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField47: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ShadowRegMask'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField48: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'IndexReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField49: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'DataReg'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object WordField50: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'RegAddressSize'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 4
      MinValue = 1
    end
    object WordField51: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'RegDataSize'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 4
      MinValue = 1
    end
    object WideStringField4: TWideStringField
      FieldName = 'Caption'
      Required = True
      Size = 50
    end
    object IntegerField7: TIntegerField
      FieldName = 'Tab'
    end
    object IntegerField8: TIntegerField
      FieldName = 'Tag'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object WideStringField5: TWideStringField
      FieldName = 'Name'
      Required = True
      Size = 32
    end
    object WordField52: TWordField
      FieldName = 'SlaveAddr'
      OnGetText = GetHexText
      OnSetText = SetHexText
      MaxValue = 255
    end
    object IntegerField9: TIntegerField
      FieldName = 'Column'
      MaxValue = 128
      MinValue = 16
    end
    object IntegerField10: TIntegerField
      FieldName = 'Row'
      MaxValue = 128
      MinValue = 16
    end
  end
  object conADOConnection3: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";User ID=Admin;Data ' +
      'Source=C:\LXSDK\Tool\LXTool\ChipDebugger\MDB\SVP-UX.mdb;Mode=Sha' +
      're Deny None;Extended Properties="";Jet OLEDB:System database=""' +
      ';Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet O' +
      'LEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:G' +
      'lobal Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Je' +
      't OLEDB:New Database Password="";Jet OLEDB:Create System Databas' +
      'e=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Lo' +
      'cale on Compact=False;Jet OLEDB:Compact Without Replica Repair=F' +
      'alse;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 774
    Top = 609
  end
  object tblCopySource: TADOTable
    Connection = conADOConnection3
    CursorType = ctStatic
    TableName = 'Register'
    Left = 806
    Top = 673
    object AutoIncField4: TAutoIncField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
    end
    object WideStringField6: TWideStringField
      FieldName = 'RegName'
    end
    object IntegerField11: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Page'
    end
    object IntegerField12: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'RegAddress'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object MemoField2: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
    end
    object IntegerField13: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DefaultVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object WordField53: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit0Right'
    end
    object WordField54: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit1Right'
    end
    object WordField55: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit2Right'
    end
    object WordField56: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit3Right'
    end
    object WordField57: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit4Right'
    end
    object WordField58: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit5Right'
    end
    object WordField59: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit6Right'
    end
    object WordField60: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit7Right'
    end
    object WordField61: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit8Right'
    end
    object WordField62: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit9Right'
    end
    object WordField63: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit10Right'
    end
    object WordField64: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit11Right'
    end
    object WordField65: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit12Right'
    end
    object WordField66: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit13Right'
    end
    object WordField67: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit14Right'
    end
    object WordField68: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit15Right'
    end
    object WordField69: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit16Right'
    end
    object WordField70: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit17Right'
    end
    object WordField71: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit18Right'
    end
    object WordField72: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit19Right'
    end
    object WordField73: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit20Right'
    end
    object WordField74: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit21Right'
    end
    object WordField75: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit22Right'
    end
    object WordField76: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit23Right'
    end
    object WordField77: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit24Right'
    end
    object WordField78: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit25Right'
    end
    object WordField79: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit26Right'
    end
    object WordField80: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit27Right'
    end
    object WordField81: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit28Right'
    end
    object WordField82: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit29Right'
    end
    object WordField83: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit30Right'
    end
    object WordField84: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit31Right'
    end
    object IntegerField14: TIntegerField
      FieldName = 'Flag'
    end
  end
  object tblCopyTarget: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Register'
    Left = 902
    Top = 577
    object AutoIncField5: TAutoIncField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
    end
    object WideStringField7: TWideStringField
      FieldName = 'RegName'
    end
    object IntegerField15: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Page'
    end
    object IntegerField16: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'RegAddress'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object MemoField3: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
    end
    object IntegerField17: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DefaultVal'
      OnGetText = GetHexText
      OnSetText = SetHexText
    end
    object WordField85: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit0Right'
    end
    object WordField86: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit1Right'
    end
    object WordField87: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit2Right'
    end
    object WordField88: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit3Right'
    end
    object WordField89: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit4Right'
    end
    object WordField90: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit5Right'
    end
    object WordField91: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit6Right'
    end
    object WordField92: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit7Right'
    end
    object WordField93: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit8Right'
    end
    object WordField94: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit9Right'
    end
    object WordField95: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit10Right'
    end
    object WordField96: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit11Right'
    end
    object WordField97: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit12Right'
    end
    object WordField98: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit13Right'
    end
    object WordField99: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit14Right'
    end
    object WordField100: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit15Right'
    end
    object WordField101: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit16Right'
    end
    object WordField102: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit17Right'
    end
    object WordField103: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit18Right'
    end
    object WordField104: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit19Right'
    end
    object WordField105: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit20Right'
    end
    object WordField106: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit21Right'
    end
    object WordField107: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit22Right'
    end
    object WordField108: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit23Right'
    end
    object WordField109: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit24Right'
    end
    object WordField110: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit25Right'
    end
    object WordField111: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit26Right'
    end
    object WordField112: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit27Right'
    end
    object WordField113: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit28Right'
    end
    object WordField114: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit29Right'
    end
    object WordField115: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit30Right'
    end
    object WordField116: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'Bit31Right'
    end
    object IntegerField18: TIntegerField
      FieldName = 'Flag'
    end
  end
  object dlgOpenImport: TOpenDialog
    Filter = 'CVS files(*.csv)|*.csv|Excel files(*.xls;*.xlsx)|*.xls;*.xlsx'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 400
    Top = 544
  end
  object dlgSaveFile: TSaveDialog
    DefaultExt = 'h'
    Filter = '*.h'
    Left = 448
    Top = 546
  end
  object RegisterFieldTable: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterPost = TabTableAfterScroll
    BeforeDelete = TabTableBeforeDelete
    AfterScroll = TabTableAfterScroll
    TableName = 'RegisterField'
    Left = 806
    Top = 545
  end
  object RegisterFieldSource: TDataSource
    DataSet = RegisterFieldTable
    Left = 926
    Top = 545
  end
  object Query2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 694
    Top = 617
  end
end
