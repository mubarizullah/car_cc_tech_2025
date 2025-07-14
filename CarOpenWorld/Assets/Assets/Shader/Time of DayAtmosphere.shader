Shader "Time of Day/Atmosphere" {
	Properties {
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Background+50" "RenderType" = "Background" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Background+50" "RenderType" = "Background" }
			Blend One One, One One
			ZWrite Off
			Fog {
				Mode Off
			}
			GpuProgramID 47920
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat1);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat1);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat1);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat1);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat1);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    vs_TEXCOORD1 = sqrt(u_xlat1);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    vs_TEXCOORD1 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    vs_TEXCOORD1 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    vs_TEXCOORD1 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    vs_TEXCOORD1 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    vs_TEXCOORD1 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.w = 1.0;
					    u_xlat0 = u_xlat0 * (-vec4(TOD_Brightness));
					    u_xlat0 = exp2(u_xlat0);
					    vs_TEXCOORD1 = (-u_xlat0) + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    vs_TEXCOORD1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    vs_TEXCOORD1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    vs_TEXCOORD1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    vs_TEXCOORD1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    vs_TEXCOORD1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.w = 1.0;
					    u_xlat1 = u_xlat1 * (-vec4(TOD_Brightness));
					    u_xlat1 = exp2(u_xlat1);
					    vs_TEXCOORD1 = (-u_xlat1) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(TOD_Brightness));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat1.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat1.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat1.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat1.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat1.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    vs_TEXCOORD1.xyz = sqrt(u_xlat1.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat11;
					float u_xlat14;
					float u_xlat22;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.yxz;
					    u_xlat0.w = max(u_xlat0.x, 0.0);
					    u_xlat1.x = dot(u_xlat0.yzw, u_xlat0.yzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.ywz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat1.y * u_xlat1.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat3.x = u_xlat1.y * u_xlat2.y;
					    u_xlat3.x = u_xlat3.x / u_xlat2.y;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat11.x = u_xlat3.x * 5.25 + -6.80000019;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 3.82999992;
					    u_xlat11.x = u_xlat3.x * u_xlat11.x + 0.458999991;
					    u_xlat3.x = u_xlat3.x * u_xlat11.x + -0.00286999997;
					    u_xlat3.x = u_xlat3.x * 1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat26 = u_xlat26 * u_xlat3.x;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat3.x = u_xlat25 * TOD_kScale.x;
					    u_xlat11.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat11.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat6.x = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat14 = u_xlat3.x * u_xlat29;
					        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat30 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat30 = (-u_xlat30) * u_xlat6.x + 1.0;
					        u_xlat7 = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat7 = u_xlat30 * u_xlat7 + 3.82999992;
					        u_xlat7 = u_xlat30 * u_xlat7 + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat7 + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat6.x = (-u_xlat22) * u_xlat6.x + 1.0;
					        u_xlat22 = u_xlat6.x * 5.25 + -6.80000019;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 3.82999992;
					        u_xlat22 = u_xlat6.x * u_xlat22 + 0.458999991;
					        u_xlat6.x = u_xlat6.x * u_xlat22 + -0.00286999997;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * 0.25;
					        u_xlat6.x = u_xlat30 * 0.25 + (-u_xlat6.x);
					        u_xlat29 = u_xlat29 * u_xlat6.x;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat6.xzw = u_xlat11.xyz * (-vec3(u_xlat29));
					        u_xlat6.xzw = u_xlat6.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat6.xzw = exp2(u_xlat6.xzw);
					        u_xlat5.xyz = u_xlat6.xzw * vec3(u_xlat14) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat25) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * TOD_kSun.www;
					    u_xlat25 = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat26 = u_xlat25 * u_xlat25;
					    u_xlat24 = (-u_xlat0.w) * 0.75 + 1.0;
					    u_xlat8.x = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * TOD_MoonHaloPower;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat8.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat24) + u_xlat3.xyz;
					    u_xlat26 = u_xlat26 * 0.75 + 0.75;
					    u_xlat8.xyz = vec3(u_xlat26) * u_xlat2.xyz + u_xlat8.xyz;
					    u_xlat2.x = u_xlat25 * u_xlat25 + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat25 = TOD_kBetaMie.z * u_xlat25 + TOD_kBetaMie.y;
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.5;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat2.x / u_xlat25;
					    u_xlat8.xyz = vec3(u_xlat25) * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat8.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat0.xyz);
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    SV_Target0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    SV_Target0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    SV_Target0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    SV_Target0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    SV_Target0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat13;
					float u_xlat20;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					float u_xlat27;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
					    u_xlat0.w = max(u_xlat0.y, 0.0);
					    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat0.xwz * u_xlat1.xxx;
					    u_xlat2.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat21 = u_xlat1.y * u_xlat1.y;
					    u_xlat21 = u_xlat21 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat21 = u_xlat21 + (-TOD_kRadius.y);
					    u_xlat21 = sqrt(u_xlat21);
					    u_xlat21 = (-TOD_kRadius.x) * u_xlat1.y + u_xlat21;
					    u_xlat22 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat22 = u_xlat22 * 1.44269502;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat23 = u_xlat1.y * u_xlat2.y;
					    u_xlat23 = u_xlat23 / u_xlat2.y;
					    u_xlat23 = (-u_xlat23) + 1.0;
					    u_xlat3.x = u_xlat23 * 5.25 + -6.80000019;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 3.82999992;
					    u_xlat3.x = u_xlat23 * u_xlat3.x + 0.458999991;
					    u_xlat23 = u_xlat23 * u_xlat3.x + -0.00286999997;
					    u_xlat23 = u_xlat23 * 1.44269502;
					    u_xlat23 = exp2(u_xlat23);
					    u_xlat22 = u_xlat22 * u_xlat23;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat23 = u_xlat21 * TOD_kScale.x;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat3.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat4.xyz = u_xlat2.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = max(u_xlat25, 1.0);
					        u_xlat26 = float(1.0) / u_xlat25;
					        u_xlat25 = (-u_xlat25) + TOD_kRadius.x;
					        u_xlat25 = u_xlat25 * TOD_kScale.z;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat6 = u_xlat23 * u_xlat25;
					        u_xlat13.x = dot(u_xlat1.xyz, u_xlat4.xyz);
					        u_xlat20 = dot(TOD_LocalSunDirection.xyz, u_xlat4.xyz);
					        u_xlat20 = (-u_xlat20) * u_xlat26 + 1.0;
					        u_xlat27 = u_xlat20 * 5.25 + -6.80000019;
					        u_xlat27 = u_xlat20 * u_xlat27 + 3.82999992;
					        u_xlat27 = u_xlat20 * u_xlat27 + 0.458999991;
					        u_xlat20 = u_xlat20 * u_xlat27 + -0.00286999997;
					        u_xlat20 = u_xlat20 * 1.44269502;
					        u_xlat20 = exp2(u_xlat20);
					        u_xlat26 = (-u_xlat13.x) * u_xlat26 + 1.0;
					        u_xlat13.x = u_xlat26 * 5.25 + -6.80000019;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 3.82999992;
					        u_xlat13.x = u_xlat26 * u_xlat13.x + 0.458999991;
					        u_xlat26 = u_xlat26 * u_xlat13.x + -0.00286999997;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat26 = u_xlat26 * 0.25;
					        u_xlat26 = u_xlat20 * 0.25 + (-u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat25 = u_xlat22 * 0.25 + u_xlat25;
					        u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat25));
					        u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat13.xyz = exp2(u_xlat13.xyz);
					        u_xlat5.xyz = u_xlat13.xyz * vec3(u_xlat6) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat4.xyz;
					    }
					    u_xlat1.xyz = u_xlat5.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz * TOD_kSun.www;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    SV_Target0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat8;
					vec3 u_xlat10;
					vec3 u_xlat13;
					float u_xlat16;
					float u_xlat25;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.yxz;
					    u_xlat1.w = max(u_xlat1.x, 0.0);
					    u_xlat2.x = dot(u_xlat1.yzw, u_xlat1.yzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.ywz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat29 = u_xlat2.y * u_xlat2.y;
					    u_xlat29 = u_xlat29 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat29 = u_xlat29 + (-TOD_kRadius.y);
					    u_xlat29 = sqrt(u_xlat29);
					    u_xlat29 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat29;
					    u_xlat30 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat30 = u_xlat30 * 1.44269502;
					    u_xlat30 = exp2(u_xlat30);
					    u_xlat4.x = u_xlat2.y * u_xlat3.y;
					    u_xlat4.x = u_xlat4.x / u_xlat3.y;
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat13.x = u_xlat4.x * 5.25 + -6.80000019;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 3.82999992;
					    u_xlat13.x = u_xlat4.x * u_xlat13.x + 0.458999991;
					    u_xlat4.x = u_xlat4.x * u_xlat13.x + -0.00286999997;
					    u_xlat4.x = u_xlat4.x * 1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat30 = u_xlat30 * u_xlat4.x;
					    u_xlat29 = u_xlat29 * 0.5;
					    u_xlat4.x = u_xlat29 * TOD_kScale.x;
					    u_xlat13.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat13.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat33 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat33 = sqrt(u_xlat33);
					        u_xlat33 = max(u_xlat33, 1.0);
					        u_xlat7.x = float(1.0) / u_xlat33;
					        u_xlat33 = (-u_xlat33) + TOD_kRadius.x;
					        u_xlat33 = u_xlat33 * TOD_kScale.z;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat16 = u_xlat4.x * u_xlat33;
					        u_xlat25 = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat34 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat34 = (-u_xlat34) * u_xlat7.x + 1.0;
					        u_xlat8 = u_xlat34 * 5.25 + -6.80000019;
					        u_xlat8 = u_xlat34 * u_xlat8 + 3.82999992;
					        u_xlat8 = u_xlat34 * u_xlat8 + 0.458999991;
					        u_xlat34 = u_xlat34 * u_xlat8 + -0.00286999997;
					        u_xlat34 = u_xlat34 * 1.44269502;
					        u_xlat34 = exp2(u_xlat34);
					        u_xlat7.x = (-u_xlat25) * u_xlat7.x + 1.0;
					        u_xlat25 = u_xlat7.x * 5.25 + -6.80000019;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 3.82999992;
					        u_xlat25 = u_xlat7.x * u_xlat25 + 0.458999991;
					        u_xlat7.x = u_xlat7.x * u_xlat25 + -0.00286999997;
					        u_xlat7.x = u_xlat7.x * 1.44269502;
					        u_xlat7.x = exp2(u_xlat7.x);
					        u_xlat7.x = u_xlat7.x * 0.25;
					        u_xlat7.x = u_xlat34 * 0.25 + (-u_xlat7.x);
					        u_xlat33 = u_xlat33 * u_xlat7.x;
					        u_xlat33 = u_xlat30 * 0.25 + u_xlat33;
					        u_xlat7.xzw = u_xlat13.xyz * (-vec3(u_xlat33));
					        u_xlat7.xzw = u_xlat7.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat7.xzw = exp2(u_xlat7.xzw);
					        u_xlat6.xyz = u_xlat7.xzw * vec3(u_xlat16) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat29 = dot(TOD_LocalSunDirection.yxz, u_xlat1.xyz);
					    u_xlat30 = u_xlat29 * u_xlat29;
					    u_xlat28 = (-u_xlat1.w) * 0.75 + 1.0;
					    u_xlat10.x = dot(u_xlat1.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat10.x = max(u_xlat10.x, 0.0);
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * TOD_MoonHaloPower;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat4.xyz = u_xlat10.xxx * TOD_MoonHaloColor.xyz;
					    u_xlat10.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat28) + u_xlat4.xyz;
					    u_xlat30 = u_xlat30 * 0.75 + 0.75;
					    u_xlat10.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat10.xyz;
					    u_xlat3.x = u_xlat29 * u_xlat29 + 1.0;
					    u_xlat3.x = u_xlat3.x * TOD_kBetaMie.x;
					    u_xlat29 = TOD_kBetaMie.z * u_xlat29 + TOD_kBetaMie.y;
					    u_xlat29 = log2(u_xlat29);
					    u_xlat29 = u_xlat29 * 1.5;
					    u_xlat29 = exp2(u_xlat29);
					    u_xlat29 = u_xlat3.x / u_xlat29;
					    u_xlat10.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat1.x = (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2.xyz = (-u_xlat10.xyz) + TOD_GroundColor.xyz;
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + TOD_FogColor.xyz;
					    u_xlat1.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(TOD_Brightness);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    vs_TEXCOORD1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat10.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat10.x * 0.5;
					    u_xlat1.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					void main()
					{
					    u_xlat16_0 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + vs_TEXCOORD1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					attribute highp vec4 in_POSITION0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					uniform lowp sampler2D TOD_BayerTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					lowp float u_xlat10_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat10_6 = texture2D(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat10_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 TOD_SunSkyColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec4 TOD_kSun;
					uniform 	vec4 TOD_k4PI;
					uniform 	vec4 TOD_kRadius;
					uniform 	vec4 TOD_kScale;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec3 u_xlat15;
					float u_xlat23;
					float u_xlat25;
					float u_xlat26;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					float u_xlat31;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * in_POSITION0.xyz;
					    u_xlat1.w = max(u_xlat1.y, 0.0);
					    u_xlat2.x = dot(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat1.xwz * u_xlat2.xxx;
					    u_xlat3.y = TOD_kRadius.x + TOD_kScale.w;
					    u_xlat25 = u_xlat2.y * u_xlat2.y;
					    u_xlat25 = u_xlat25 * TOD_kRadius.y + TOD_kRadius.w;
					    u_xlat25 = u_xlat25 + (-TOD_kRadius.y);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = (-TOD_kRadius.x) * u_xlat2.y + u_xlat25;
					    u_xlat26 = (-TOD_kScale.w) * TOD_kScale.z;
					    u_xlat26 = u_xlat26 * 1.44269502;
					    u_xlat26 = exp2(u_xlat26);
					    u_xlat27 = u_xlat2.y * u_xlat3.y;
					    u_xlat27 = u_xlat27 / u_xlat3.y;
					    u_xlat27 = (-u_xlat27) + 1.0;
					    u_xlat4.x = u_xlat27 * 5.25 + -6.80000019;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 3.82999992;
					    u_xlat4.x = u_xlat27 * u_xlat4.x + 0.458999991;
					    u_xlat27 = u_xlat27 * u_xlat4.x + -0.00286999997;
					    u_xlat27 = u_xlat27 * 1.44269502;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat26 = u_xlat26 * u_xlat27;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat27 = u_xlat25 * TOD_kScale.x;
					    u_xlat4.xyz = vec3(u_xlat25) * u_xlat2.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xyz = TOD_k4PI.www + TOD_k4PI.xyz;
					    u_xlat5.xyz = u_xlat3.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
					    {
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = max(u_xlat29, 1.0);
					        u_xlat30 = float(1.0) / u_xlat29;
					        u_xlat29 = (-u_xlat29) + TOD_kRadius.x;
					        u_xlat29 = u_xlat29 * TOD_kScale.z;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat7 = u_xlat27 * u_xlat29;
					        u_xlat15.x = dot(u_xlat2.xyz, u_xlat5.xyz);
					        u_xlat23 = dot(TOD_LocalSunDirection.xyz, u_xlat5.xyz);
					        u_xlat23 = (-u_xlat23) * u_xlat30 + 1.0;
					        u_xlat31 = u_xlat23 * 5.25 + -6.80000019;
					        u_xlat31 = u_xlat23 * u_xlat31 + 3.82999992;
					        u_xlat31 = u_xlat23 * u_xlat31 + 0.458999991;
					        u_xlat23 = u_xlat23 * u_xlat31 + -0.00286999997;
					        u_xlat23 = u_xlat23 * 1.44269502;
					        u_xlat23 = exp2(u_xlat23);
					        u_xlat30 = (-u_xlat15.x) * u_xlat30 + 1.0;
					        u_xlat15.x = u_xlat30 * 5.25 + -6.80000019;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 3.82999992;
					        u_xlat15.x = u_xlat30 * u_xlat15.x + 0.458999991;
					        u_xlat30 = u_xlat30 * u_xlat15.x + -0.00286999997;
					        u_xlat30 = u_xlat30 * 1.44269502;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = u_xlat30 * 0.25;
					        u_xlat30 = u_xlat23 * 0.25 + (-u_xlat30);
					        u_xlat29 = u_xlat29 * u_xlat30;
					        u_xlat29 = u_xlat26 * 0.25 + u_xlat29;
					        u_xlat15.xyz = u_xlat4.xyz * (-vec3(u_xlat29));
					        u_xlat15.xyz = u_xlat15.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					        u_xlat15.xyz = exp2(u_xlat15.xyz);
					        u_xlat6.xyz = u_xlat15.xyz * vec3(u_xlat7) + u_xlat6.xyz;
					        u_xlat5.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat5.xyz;
					    }
					    u_xlat2.xyz = u_xlat6.xyz * TOD_SunSkyColor.xyz;
					    vs_TEXCOORD1.xyz = u_xlat2.xyz * TOD_kSun.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz * TOD_kSun.www;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat25 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat0.ww;
					    u_xlat2.xy = u_xlat2.xy * _ScreenParams.xy;
					    vs_TEXCOORD0.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 TOD_MoonSkyColor;
					uniform 	vec3 TOD_FogColor;
					uniform 	vec3 TOD_GroundColor;
					uniform 	vec3 TOD_LocalSunDirection;
					uniform 	vec3 TOD_LocalMoonDirection;
					uniform 	float TOD_Contrast;
					uniform 	float TOD_Brightness;
					uniform 	float TOD_Fogginess;
					uniform 	float TOD_MoonHaloPower;
					uniform 	vec3 TOD_MoonHaloColor;
					uniform 	vec3 TOD_kBetaMie;
					UNITY_LOCATION(0) uniform mediump sampler2D TOD_BayerTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.yxz;
					    u_xlat6 = dot(u_xlat0.yxz, TOD_LocalMoonDirection.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * TOD_MoonHaloPower;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * TOD_MoonHaloColor.xyz;
					    u_xlat6 = max(u_xlat0.x, 0.0);
					    u_xlat6 = (-u_xlat6) * 0.75 + 1.0;
					    u_xlat1.xyz = TOD_MoonSkyColor.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat2.x = dot(TOD_LocalSunDirection.yxz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat4 * 0.75 + 0.75;
					    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz + u_xlat1.xyz;
					    u_xlat4 = TOD_kBetaMie.z * u_xlat2.x + TOD_kBetaMie.y;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.0;
					    u_xlat2.x = u_xlat2.x * TOD_kBetaMie.x;
					    u_xlat4 = log2(u_xlat4);
					    u_xlat4 = u_xlat4 * 1.5;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat2.x = u_xlat2.x / u_xlat4;
					    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + TOD_GroundColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + TOD_FogColor.xyz;
					    u_xlat0.xyz = vec3(vec3(TOD_Fogginess, TOD_Fogginess, TOD_Fogginess)) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(TOD_Brightness);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(TOD_Contrast, TOD_Contrast, TOD_Contrast));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat16_6 = texture(TOD_BayerTexture, vs_TEXCOORD0.xy).w;
					    SV_Target0.xyz = vec3(u_xlat16_6) * vec3(0.0153846154, 0.0153846154, 0.0153846154) + u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_DITHERING" "TOD_OUTPUT_HDR" "TOD_OUTPUT_LINEAR" "TOD_SCATTERING_PER_PIXEL" }
					"!!GLES3"
				}
			}
		}
	}
}