int iCurrentThrow[MAXPLAYERS+1];
char sCurrentGrenade[MAXPLAYERS+1][64];

public Plugin myinfo =
{ 
	name = "Grenade Bounce", 
	author = "Palonez", 
	description = "Grenade Bounce", 
	version = "1.0", 
	url = "https://github.com/Quake1011" 
};

public void OnPluginStart()
{
    HookEvent("grenade_bounce", bounce);
    HookEvent("grenade_thrown", throwing);
}

public void bounce(Event hEvent, const char[] sEvent, bool bdb)
{
    int client = GetClientOfUserId(hEvent.GetInt("userid"))
    if(0 < client <= MaxClients && IsClientInGame(client) && !IsFakeClient(client))
    {
        iCurrentThrow[client]++;
        switch(sCurrentGrenade[client][0])
        {
            case 'd': sCurrentGrenade[client][0] = 'D';
            case 'f': sCurrentGrenade[client][0] = 'F';
            case 'h': sCurrentGrenade[client][0] = 'H';
            case 's': sCurrentGrenade[client][0] = 'S';
            case 'i': sCurrentGrenade[client][0] = 'I';
        }
        PrintToChatAll("%s has bounced %d times", sCurrentGrenade[client], iCurrentThrow[client]);
    }
}

public void throwing(Event hEvent, const char[] sEvent, bool bdb)
{
    int client = GetClientOfUserId(hEvent.GetInt("userid"))
    if(0 < client <= MaxClients && IsClientInGame(client) && !IsFakeClient(client))
    {
        iCurrentThrow[client] = 0;
        hEvent.GetString("weapon", sCurrentGrenade[client], sizeof(sCurrentGrenade[]))
    }
}