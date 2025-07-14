Shader "Water+/Mobile Opaque" {
	Properties {
		_MainTex ("Main texture", 2D) = "bump" {}
		_Cube ("Cubemap", Cube) = "" {}
		_WaterMap ("Depth (R), Foam (G), Transparency(B) Refr strength(A)", 2D) = "white" {}
		_SecondaryRefractionTex ("Refraction texture", 2D) = "bump" {}
		_AnisoMap ("AnisoDir(RGB), AnisoLookup(A)", 2D) = "bump" {}
		_Reflectivity ("Reflectivity", Range(0, 1)) = 0.3
		_Refractivity ("Refractivity", Range(1, 5)) = 1
		_WaterAttenuation ("Water attenuation", Range(0, 2)) = 1
		_ShallowWaterTint ("Shallow water tint", Vector) = (0,0.26,0.39,1)
		_DeepWaterTint ("Deep water tint", Vector) = (0,0.26,0.39,1)
		_Shininess ("Shininess", Range(0.05, 20)) = 1
		_Gloss ("Gloss", Range(0, 20)) = 10
		_Fresnel0 ("fresnel0", Float) = 0.1
		_EdgeFoamStrength ("Edge foam strength", Range(0, 3)) = 1
		_normalStrength ("Normal strength", Range(0.01, 5)) = 1
		_refractionsWetness ("Refractions wetness", Range(0, 1)) = 0.8
		_Opaqueness ("Opaqueness", Range(0, 1)) = 0.9
	}
	SubShader {
		Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" }
		Pass {
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" }
			GpuProgramID 31831
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD2;
					varying highp vec2 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    vs_COLOR0.xyz = u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _SecondaryRefractionTex_ST.xy + _SecondaryRefractionTex_ST.zw;
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
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	mediump vec4 _LightColor0;
					uniform 	mediump float _EdgeFoamStrength;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					uniform 	mediump float _refractionsWetness;
					uniform 	mediump float _Refractivity;
					uniform 	mediump float _normalStrength;
					uniform 	mediump float _Reflectivity;
					uniform 	mediump float _WaterAttenuation;
					uniform 	mediump vec3 _DeepWaterTint;
					uniform 	mediump vec3 _ShallowWaterTint;
					uniform 	mediump float _Gloss;
					uniform 	mediump float _Opaqueness;
					uniform lowp sampler2D _WaterMap;
					uniform lowp sampler2D _DUDVFoamMap;
					uniform lowp sampler2D _SecondaryRefractionTex;
					uniform lowp samplerCube _Cube;
					uniform lowp sampler2D _AnisoMap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD2;
					varying highp vec2 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					int u_xlati0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec2 u_xlat16_5;
					mediump float u_xlat16_6;
					int u_xlati7;
					mediump float u_xlat16_11;
					mediump vec3 u_xlat16_12;
					mediump float u_xlat16_24;
					mediump float u_xlat16_25;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_DUDVFoamMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_1 = u_xlat16_1 * vec4(_Refractivity, _Refractivity, _normalStrength, _normalStrength);
					    u_xlat0.xy = u_xlat16_1.xy * _SecondaryRefractionTex_ST.xx;
					    u_xlat1.xz = u_xlat16_1.zw * vec2(0.0199999996, 0.0199999996);
					    u_xlat0.xy = u_xlat0.xy * vec2(9.99999975e-06, 9.99999975e-06) + vs_TEXCOORD5.xy;
					    u_xlat10_0.xyw = texture2D(_SecondaryRefractionTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_0.xyw * vec3(_refractionsWetness);
					    u_xlat16_3.xyz = (-u_xlat10_0.xyw) * vec3(_refractionsWetness) + _ShallowWaterTint.xyz;
					    u_xlat10_0.xyw = texture2D(_WaterMap, vs_TEXCOORD1.xy).xyw;
					    u_xlat16_24 = u_xlat10_0.w * 0.5;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = vec3(_DeepWaterTint.x, _DeepWaterTint.y, _DeepWaterTint.z) + (-_ShallowWaterTint.xyz);
					    u_xlat16_25 = u_xlat10_0.x * _WaterAttenuation;
					    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
					    u_xlat16_5.x = u_xlat10_0.y * _EdgeFoamStrength;
					    u_xlat16_5.x = u_xlat10_0.z * u_xlat16_5.x;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _ShallowWaterTint.xyz;
					    u_xlat16_24 = max(u_xlat16_24, u_xlat16_25);
					    u_xlat16_24 = u_xlat16_24 * 0.800000012;
					    u_xlat16_24 = min(u_xlat16_24, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_24 = dot(vs_COLOR0.xyz, vs_COLOR0.xyz);
					    u_xlat16_24 = inversesqrt(u_xlat16_24);
					    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_COLOR0.xyz;
					    u_xlat1.y = 1.0;
					    u_xlat16_24 = dot((-u_xlat16_4.xyz), u_xlat1.xyz);
					    u_xlat16_24 = u_xlat16_24 + u_xlat16_24;
					    u_xlat16_12.xyz = u_xlat1.xyz * (-vec3(u_xlat16_24)) + (-u_xlat16_4.xyz);
					    u_xlat10_0.xyw = textureCube(_Cube, u_xlat16_12.xyz).xyz;
					    u_xlat16_12.xyz = (-u_xlat16_3.xyz) + u_xlat10_0.xyw;
					    u_xlat16_24 = dot(u_xlat1.xyz, u_xlat16_4.xyz);
					    u_xlat16_25 = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
					    u_xlat16_25 = max(u_xlat16_25, 0.0);
					    u_xlat16_6 = (-u_xlat16_24) + 0.5;
					    u_xlat16_24 = max(u_xlat16_24, 0.0);
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_25 = max(u_xlat16_6, 0.0);
					    u_xlat16_6 = min(u_xlat16_25, _Reflectivity);
					    u_xlat16_3.xyz = vec3(u_xlat16_6) * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_12.xyz = u_xlat10_0.zzz + (-u_xlat16_3.xyz);
					    u_xlat16_3.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat10_0.xyz = texture2D(_AnisoMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.y = dot(u_xlat16_4.xyz, u_xlat16_0.xyz);
					    u_xlat16_4.x = dot(u_xlat16_4.xyz, (-vs_TEXCOORD2.xyz));
					    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xy = u_xlat16_5.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(0.5, 0.5);
					    u_xlat10_0.x = texture2D(_AnisoMap, u_xlat0.xy).w;
					    u_xlat16_11 = u_xlat10_0.x * _Gloss;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_11;
					    u_xlati0 = int((0.0<u_xlat16_4.x) ? -1 : 0);
					    u_xlati7 = int((u_xlat16_4.x<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati7;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = _LightColor0.x * 0.5;
					    u_xlat16_24 = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * 10.0;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz + vec3(u_xlat16_24);
					    SV_Target0.xyz = u_xlat16_3.xyz + glstate_lightmodel_ambient.xyz;
					    SV_Target0.w = _Opaqueness;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD2;
					varying highp vec2 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    vs_COLOR0.xyz = u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _SecondaryRefractionTex_ST.xy + _SecondaryRefractionTex_ST.zw;
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
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	mediump vec4 _LightColor0;
					uniform 	mediump float _EdgeFoamStrength;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					uniform 	mediump float _refractionsWetness;
					uniform 	mediump float _Refractivity;
					uniform 	mediump float _normalStrength;
					uniform 	mediump float _Reflectivity;
					uniform 	mediump float _WaterAttenuation;
					uniform 	mediump vec3 _DeepWaterTint;
					uniform 	mediump vec3 _ShallowWaterTint;
					uniform 	mediump float _Gloss;
					uniform 	mediump float _Opaqueness;
					uniform lowp sampler2D _WaterMap;
					uniform lowp sampler2D _DUDVFoamMap;
					uniform lowp sampler2D _SecondaryRefractionTex;
					uniform lowp samplerCube _Cube;
					uniform lowp sampler2D _AnisoMap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD2;
					varying highp vec2 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					int u_xlati0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec2 u_xlat16_5;
					mediump float u_xlat16_6;
					int u_xlati7;
					mediump float u_xlat16_11;
					mediump vec3 u_xlat16_12;
					mediump float u_xlat16_24;
					mediump float u_xlat16_25;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_DUDVFoamMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_1 = u_xlat16_1 * vec4(_Refractivity, _Refractivity, _normalStrength, _normalStrength);
					    u_xlat0.xy = u_xlat16_1.xy * _SecondaryRefractionTex_ST.xx;
					    u_xlat1.xz = u_xlat16_1.zw * vec2(0.0199999996, 0.0199999996);
					    u_xlat0.xy = u_xlat0.xy * vec2(9.99999975e-06, 9.99999975e-06) + vs_TEXCOORD5.xy;
					    u_xlat10_0.xyw = texture2D(_SecondaryRefractionTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_0.xyw * vec3(_refractionsWetness);
					    u_xlat16_3.xyz = (-u_xlat10_0.xyw) * vec3(_refractionsWetness) + _ShallowWaterTint.xyz;
					    u_xlat10_0.xyw = texture2D(_WaterMap, vs_TEXCOORD1.xy).xyw;
					    u_xlat16_24 = u_xlat10_0.w * 0.5;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = vec3(_DeepWaterTint.x, _DeepWaterTint.y, _DeepWaterTint.z) + (-_ShallowWaterTint.xyz);
					    u_xlat16_25 = u_xlat10_0.x * _WaterAttenuation;
					    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
					    u_xlat16_5.x = u_xlat10_0.y * _EdgeFoamStrength;
					    u_xlat16_5.x = u_xlat10_0.z * u_xlat16_5.x;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _ShallowWaterTint.xyz;
					    u_xlat16_24 = max(u_xlat16_24, u_xlat16_25);
					    u_xlat16_24 = u_xlat16_24 * 0.800000012;
					    u_xlat16_24 = min(u_xlat16_24, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_24 = dot(vs_COLOR0.xyz, vs_COLOR0.xyz);
					    u_xlat16_24 = inversesqrt(u_xlat16_24);
					    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_COLOR0.xyz;
					    u_xlat1.y = 1.0;
					    u_xlat16_24 = dot((-u_xlat16_4.xyz), u_xlat1.xyz);
					    u_xlat16_24 = u_xlat16_24 + u_xlat16_24;
					    u_xlat16_12.xyz = u_xlat1.xyz * (-vec3(u_xlat16_24)) + (-u_xlat16_4.xyz);
					    u_xlat10_0.xyw = textureCube(_Cube, u_xlat16_12.xyz).xyz;
					    u_xlat16_12.xyz = (-u_xlat16_3.xyz) + u_xlat10_0.xyw;
					    u_xlat16_24 = dot(u_xlat1.xyz, u_xlat16_4.xyz);
					    u_xlat16_25 = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
					    u_xlat16_25 = max(u_xlat16_25, 0.0);
					    u_xlat16_6 = (-u_xlat16_24) + 0.5;
					    u_xlat16_24 = max(u_xlat16_24, 0.0);
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_25 = max(u_xlat16_6, 0.0);
					    u_xlat16_6 = min(u_xlat16_25, _Reflectivity);
					    u_xlat16_3.xyz = vec3(u_xlat16_6) * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_12.xyz = u_xlat10_0.zzz + (-u_xlat16_3.xyz);
					    u_xlat16_3.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat10_0.xyz = texture2D(_AnisoMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.y = dot(u_xlat16_4.xyz, u_xlat16_0.xyz);
					    u_xlat16_4.x = dot(u_xlat16_4.xyz, (-vs_TEXCOORD2.xyz));
					    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xy = u_xlat16_5.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(0.5, 0.5);
					    u_xlat10_0.x = texture2D(_AnisoMap, u_xlat0.xy).w;
					    u_xlat16_11 = u_xlat10_0.x * _Gloss;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_11;
					    u_xlati0 = int((0.0<u_xlat16_4.x) ? -1 : 0);
					    u_xlati7 = int((u_xlat16_4.x<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati7;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = _LightColor0.x * 0.5;
					    u_xlat16_24 = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * 10.0;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz + vec3(u_xlat16_24);
					    SV_Target0.xyz = u_xlat16_3.xyz + glstate_lightmodel_ambient.xyz;
					    SV_Target0.w = _Opaqueness;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD2;
					varying highp vec2 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    vs_COLOR0.xyz = u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _SecondaryRefractionTex_ST.xy + _SecondaryRefractionTex_ST.zw;
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
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	mediump vec4 _LightColor0;
					uniform 	mediump float _EdgeFoamStrength;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					uniform 	mediump float _refractionsWetness;
					uniform 	mediump float _Refractivity;
					uniform 	mediump float _normalStrength;
					uniform 	mediump float _Reflectivity;
					uniform 	mediump float _WaterAttenuation;
					uniform 	mediump vec3 _DeepWaterTint;
					uniform 	mediump vec3 _ShallowWaterTint;
					uniform 	mediump float _Gloss;
					uniform 	mediump float _Opaqueness;
					uniform lowp sampler2D _WaterMap;
					uniform lowp sampler2D _DUDVFoamMap;
					uniform lowp sampler2D _SecondaryRefractionTex;
					uniform lowp samplerCube _Cube;
					uniform lowp sampler2D _AnisoMap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD2;
					varying highp vec2 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					int u_xlati0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec2 u_xlat16_5;
					mediump float u_xlat16_6;
					int u_xlati7;
					mediump float u_xlat16_11;
					mediump vec3 u_xlat16_12;
					mediump float u_xlat16_24;
					mediump float u_xlat16_25;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_DUDVFoamMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_1 = u_xlat16_1 * vec4(_Refractivity, _Refractivity, _normalStrength, _normalStrength);
					    u_xlat0.xy = u_xlat16_1.xy * _SecondaryRefractionTex_ST.xx;
					    u_xlat1.xz = u_xlat16_1.zw * vec2(0.0199999996, 0.0199999996);
					    u_xlat0.xy = u_xlat0.xy * vec2(9.99999975e-06, 9.99999975e-06) + vs_TEXCOORD5.xy;
					    u_xlat10_0.xyw = texture2D(_SecondaryRefractionTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_0.xyw * vec3(_refractionsWetness);
					    u_xlat16_3.xyz = (-u_xlat10_0.xyw) * vec3(_refractionsWetness) + _ShallowWaterTint.xyz;
					    u_xlat10_0.xyw = texture2D(_WaterMap, vs_TEXCOORD1.xy).xyw;
					    u_xlat16_24 = u_xlat10_0.w * 0.5;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = vec3(_DeepWaterTint.x, _DeepWaterTint.y, _DeepWaterTint.z) + (-_ShallowWaterTint.xyz);
					    u_xlat16_25 = u_xlat10_0.x * _WaterAttenuation;
					    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
					    u_xlat16_5.x = u_xlat10_0.y * _EdgeFoamStrength;
					    u_xlat16_5.x = u_xlat10_0.z * u_xlat16_5.x;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _ShallowWaterTint.xyz;
					    u_xlat16_24 = max(u_xlat16_24, u_xlat16_25);
					    u_xlat16_24 = u_xlat16_24 * 0.800000012;
					    u_xlat16_24 = min(u_xlat16_24, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_24 = dot(vs_COLOR0.xyz, vs_COLOR0.xyz);
					    u_xlat16_24 = inversesqrt(u_xlat16_24);
					    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_COLOR0.xyz;
					    u_xlat1.y = 1.0;
					    u_xlat16_24 = dot((-u_xlat16_4.xyz), u_xlat1.xyz);
					    u_xlat16_24 = u_xlat16_24 + u_xlat16_24;
					    u_xlat16_12.xyz = u_xlat1.xyz * (-vec3(u_xlat16_24)) + (-u_xlat16_4.xyz);
					    u_xlat10_0.xyw = textureCube(_Cube, u_xlat16_12.xyz).xyz;
					    u_xlat16_12.xyz = (-u_xlat16_3.xyz) + u_xlat10_0.xyw;
					    u_xlat16_24 = dot(u_xlat1.xyz, u_xlat16_4.xyz);
					    u_xlat16_25 = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
					    u_xlat16_25 = max(u_xlat16_25, 0.0);
					    u_xlat16_6 = (-u_xlat16_24) + 0.5;
					    u_xlat16_24 = max(u_xlat16_24, 0.0);
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_25 = max(u_xlat16_6, 0.0);
					    u_xlat16_6 = min(u_xlat16_25, _Reflectivity);
					    u_xlat16_3.xyz = vec3(u_xlat16_6) * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_12.xyz = u_xlat10_0.zzz + (-u_xlat16_3.xyz);
					    u_xlat16_3.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat10_0.xyz = texture2D(_AnisoMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.y = dot(u_xlat16_4.xyz, u_xlat16_0.xyz);
					    u_xlat16_4.x = dot(u_xlat16_4.xyz, (-vs_TEXCOORD2.xyz));
					    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xy = u_xlat16_5.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(0.5, 0.5);
					    u_xlat10_0.x = texture2D(_AnisoMap, u_xlat0.xy).w;
					    u_xlat16_11 = u_xlat10_0.x * _Gloss;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_11;
					    u_xlati0 = int((0.0<u_xlat16_4.x) ? -1 : 0);
					    u_xlati7 = int((u_xlat16_4.x<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati7;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = _LightColor0.x * 0.5;
					    u_xlat16_24 = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * 10.0;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz + vec3(u_xlat16_24);
					    SV_Target0.xyz = u_xlat16_3.xyz + glstate_lightmodel_ambient.xyz;
					    SV_Target0.w = _Opaqueness;
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
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    vs_COLOR0.xyz = u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _SecondaryRefractionTex_ST.xy + _SecondaryRefractionTex_ST.zw;
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
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	mediump vec4 _LightColor0;
					uniform 	mediump float _EdgeFoamStrength;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					uniform 	mediump float _refractionsWetness;
					uniform 	mediump float _Refractivity;
					uniform 	mediump float _normalStrength;
					uniform 	mediump float _Reflectivity;
					uniform 	mediump float _WaterAttenuation;
					uniform 	mediump vec3 _DeepWaterTint;
					uniform 	mediump vec3 _ShallowWaterTint;
					uniform 	mediump float _Gloss;
					uniform 	mediump float _Opaqueness;
					UNITY_LOCATION(0) uniform mediump sampler2D _WaterMap;
					UNITY_LOCATION(1) uniform mediump sampler2D _DUDVFoamMap;
					UNITY_LOCATION(2) uniform mediump sampler2D _SecondaryRefractionTex;
					UNITY_LOCATION(3) uniform mediump samplerCube _Cube;
					UNITY_LOCATION(4) uniform mediump sampler2D _AnisoMap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD5;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					int u_xlati0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec2 u_xlat16_5;
					mediump float u_xlat16_6;
					int u_xlati7;
					mediump float u_xlat16_11;
					mediump vec3 u_xlat16_12;
					mediump float u_xlat16_24;
					mediump float u_xlat16_25;
					void main()
					{
					    u_xlat16_0.xyz = texture(_DUDVFoamMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat16_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_1 = u_xlat16_1 * vec4(_Refractivity, _Refractivity, _normalStrength, _normalStrength);
					    u_xlat0.xy = u_xlat16_1.xy * _SecondaryRefractionTex_ST.xx;
					    u_xlat1.xz = u_xlat16_1.zw * vec2(0.0199999996, 0.0199999996);
					    u_xlat0.xy = u_xlat0.xy * vec2(9.99999975e-06, 9.99999975e-06) + vs_TEXCOORD5.xy;
					    u_xlat16_0.xyw = texture(_SecondaryRefractionTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_0.xyw * vec3(_refractionsWetness);
					    u_xlat16_3.xyz = (-u_xlat16_0.xyw) * vec3(_refractionsWetness) + _ShallowWaterTint.xyz;
					    u_xlat16_0.xyw = texture(_WaterMap, vs_TEXCOORD1.xy).xyw;
					    u_xlat16_24 = u_xlat16_0.w * 0.5;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = vec3(_DeepWaterTint.x, _DeepWaterTint.y, _DeepWaterTint.z) + (-_ShallowWaterTint.xyz);
					    u_xlat16_25 = u_xlat16_0.x * _WaterAttenuation;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
					#else
					    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
					#endif
					    u_xlat16_5.x = u_xlat16_0.y * _EdgeFoamStrength;
					    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
					#else
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					#endif
					    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _ShallowWaterTint.xyz;
					    u_xlat16_24 = max(u_xlat16_24, u_xlat16_25);
					    u_xlat16_24 = u_xlat16_24 * 0.800000012;
					    u_xlat16_24 = min(u_xlat16_24, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_24 = dot(vs_COLOR0.xyz, vs_COLOR0.xyz);
					    u_xlat16_24 = inversesqrt(u_xlat16_24);
					    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_COLOR0.xyz;
					    u_xlat1.y = 1.0;
					    u_xlat16_24 = dot((-u_xlat16_4.xyz), u_xlat1.xyz);
					    u_xlat16_24 = u_xlat16_24 + u_xlat16_24;
					    u_xlat16_12.xyz = u_xlat1.xyz * (-vec3(u_xlat16_24)) + (-u_xlat16_4.xyz);
					    u_xlat16_0.xyw = texture(_Cube, u_xlat16_12.xyz).xyz;
					    u_xlat16_12.xyz = (-u_xlat16_3.xyz) + u_xlat16_0.xyw;
					    u_xlat16_24 = dot(u_xlat1.xyz, u_xlat16_4.xyz);
					    u_xlat16_25 = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
					    u_xlat16_25 = max(u_xlat16_25, 0.0);
					    u_xlat16_6 = (-u_xlat16_24) + 0.5;
					    u_xlat16_24 = max(u_xlat16_24, 0.0);
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_25 = max(u_xlat16_6, 0.0);
					    u_xlat16_6 = min(u_xlat16_25, _Reflectivity);
					    u_xlat16_3.xyz = vec3(u_xlat16_6) * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_12.xyz = u_xlat16_0.zzz + (-u_xlat16_3.xyz);
					    u_xlat16_3.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = texture(_AnisoMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.y = dot(u_xlat16_4.xyz, u_xlat16_0.xyz);
					    u_xlat16_4.x = dot(u_xlat16_4.xyz, (-vs_TEXCOORD2.xyz));
					    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xy = u_xlat16_5.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(0.5, 0.5);
					    u_xlat16_0.x = texture(_AnisoMap, u_xlat0.xy).w;
					    u_xlat16_11 = u_xlat16_0.x * _Gloss;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_11;
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<u_xlat16_4.x; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<u_xlat16_4.x) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat16_4.x<0.0; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati7 = int((u_xlat16_4.x<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati7;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = _LightColor0.x * 0.5;
					    u_xlat16_24 = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * 10.0;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz + vec3(u_xlat16_24);
					    SV_Target0.xyz = u_xlat16_3.xyz + glstate_lightmodel_ambient.xyz;
					    SV_Target0.w = _Opaqueness;
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
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    vs_COLOR0.xyz = u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _SecondaryRefractionTex_ST.xy + _SecondaryRefractionTex_ST.zw;
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
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	mediump vec4 _LightColor0;
					uniform 	mediump float _EdgeFoamStrength;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					uniform 	mediump float _refractionsWetness;
					uniform 	mediump float _Refractivity;
					uniform 	mediump float _normalStrength;
					uniform 	mediump float _Reflectivity;
					uniform 	mediump float _WaterAttenuation;
					uniform 	mediump vec3 _DeepWaterTint;
					uniform 	mediump vec3 _ShallowWaterTint;
					uniform 	mediump float _Gloss;
					uniform 	mediump float _Opaqueness;
					UNITY_LOCATION(0) uniform mediump sampler2D _WaterMap;
					UNITY_LOCATION(1) uniform mediump sampler2D _DUDVFoamMap;
					UNITY_LOCATION(2) uniform mediump sampler2D _SecondaryRefractionTex;
					UNITY_LOCATION(3) uniform mediump samplerCube _Cube;
					UNITY_LOCATION(4) uniform mediump sampler2D _AnisoMap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD5;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					int u_xlati0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec2 u_xlat16_5;
					mediump float u_xlat16_6;
					int u_xlati7;
					mediump float u_xlat16_11;
					mediump vec3 u_xlat16_12;
					mediump float u_xlat16_24;
					mediump float u_xlat16_25;
					void main()
					{
					    u_xlat16_0.xyz = texture(_DUDVFoamMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat16_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_1 = u_xlat16_1 * vec4(_Refractivity, _Refractivity, _normalStrength, _normalStrength);
					    u_xlat0.xy = u_xlat16_1.xy * _SecondaryRefractionTex_ST.xx;
					    u_xlat1.xz = u_xlat16_1.zw * vec2(0.0199999996, 0.0199999996);
					    u_xlat0.xy = u_xlat0.xy * vec2(9.99999975e-06, 9.99999975e-06) + vs_TEXCOORD5.xy;
					    u_xlat16_0.xyw = texture(_SecondaryRefractionTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_0.xyw * vec3(_refractionsWetness);
					    u_xlat16_3.xyz = (-u_xlat16_0.xyw) * vec3(_refractionsWetness) + _ShallowWaterTint.xyz;
					    u_xlat16_0.xyw = texture(_WaterMap, vs_TEXCOORD1.xy).xyw;
					    u_xlat16_24 = u_xlat16_0.w * 0.5;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = vec3(_DeepWaterTint.x, _DeepWaterTint.y, _DeepWaterTint.z) + (-_ShallowWaterTint.xyz);
					    u_xlat16_25 = u_xlat16_0.x * _WaterAttenuation;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
					#else
					    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
					#endif
					    u_xlat16_5.x = u_xlat16_0.y * _EdgeFoamStrength;
					    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
					#else
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					#endif
					    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _ShallowWaterTint.xyz;
					    u_xlat16_24 = max(u_xlat16_24, u_xlat16_25);
					    u_xlat16_24 = u_xlat16_24 * 0.800000012;
					    u_xlat16_24 = min(u_xlat16_24, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_24 = dot(vs_COLOR0.xyz, vs_COLOR0.xyz);
					    u_xlat16_24 = inversesqrt(u_xlat16_24);
					    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_COLOR0.xyz;
					    u_xlat1.y = 1.0;
					    u_xlat16_24 = dot((-u_xlat16_4.xyz), u_xlat1.xyz);
					    u_xlat16_24 = u_xlat16_24 + u_xlat16_24;
					    u_xlat16_12.xyz = u_xlat1.xyz * (-vec3(u_xlat16_24)) + (-u_xlat16_4.xyz);
					    u_xlat16_0.xyw = texture(_Cube, u_xlat16_12.xyz).xyz;
					    u_xlat16_12.xyz = (-u_xlat16_3.xyz) + u_xlat16_0.xyw;
					    u_xlat16_24 = dot(u_xlat1.xyz, u_xlat16_4.xyz);
					    u_xlat16_25 = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
					    u_xlat16_25 = max(u_xlat16_25, 0.0);
					    u_xlat16_6 = (-u_xlat16_24) + 0.5;
					    u_xlat16_24 = max(u_xlat16_24, 0.0);
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_25 = max(u_xlat16_6, 0.0);
					    u_xlat16_6 = min(u_xlat16_25, _Reflectivity);
					    u_xlat16_3.xyz = vec3(u_xlat16_6) * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_12.xyz = u_xlat16_0.zzz + (-u_xlat16_3.xyz);
					    u_xlat16_3.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = texture(_AnisoMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.y = dot(u_xlat16_4.xyz, u_xlat16_0.xyz);
					    u_xlat16_4.x = dot(u_xlat16_4.xyz, (-vs_TEXCOORD2.xyz));
					    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xy = u_xlat16_5.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(0.5, 0.5);
					    u_xlat16_0.x = texture(_AnisoMap, u_xlat0.xy).w;
					    u_xlat16_11 = u_xlat16_0.x * _Gloss;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_11;
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<u_xlat16_4.x; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<u_xlat16_4.x) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat16_4.x<0.0; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati7 = int((u_xlat16_4.x<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati7;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = _LightColor0.x * 0.5;
					    u_xlat16_24 = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * 10.0;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz + vec3(u_xlat16_24);
					    SV_Target0.xyz = u_xlat16_3.xyz + glstate_lightmodel_ambient.xyz;
					    SV_Target0.w = _Opaqueness;
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
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    vs_COLOR0.xyz = u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _SecondaryRefractionTex_ST.xy + _SecondaryRefractionTex_ST.zw;
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
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	mediump vec4 _LightColor0;
					uniform 	mediump float _EdgeFoamStrength;
					uniform 	vec4 _SecondaryRefractionTex_ST;
					uniform 	mediump float _refractionsWetness;
					uniform 	mediump float _Refractivity;
					uniform 	mediump float _normalStrength;
					uniform 	mediump float _Reflectivity;
					uniform 	mediump float _WaterAttenuation;
					uniform 	mediump vec3 _DeepWaterTint;
					uniform 	mediump vec3 _ShallowWaterTint;
					uniform 	mediump float _Gloss;
					uniform 	mediump float _Opaqueness;
					UNITY_LOCATION(0) uniform mediump sampler2D _WaterMap;
					UNITY_LOCATION(1) uniform mediump sampler2D _DUDVFoamMap;
					UNITY_LOCATION(2) uniform mediump sampler2D _SecondaryRefractionTex;
					UNITY_LOCATION(3) uniform mediump samplerCube _Cube;
					UNITY_LOCATION(4) uniform mediump sampler2D _AnisoMap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD5;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					int u_xlati0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec2 u_xlat16_5;
					mediump float u_xlat16_6;
					int u_xlati7;
					mediump float u_xlat16_11;
					mediump vec3 u_xlat16_12;
					mediump float u_xlat16_24;
					mediump float u_xlat16_25;
					void main()
					{
					    u_xlat16_0.xyz = texture(_DUDVFoamMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat16_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_1 = u_xlat16_1 * vec4(_Refractivity, _Refractivity, _normalStrength, _normalStrength);
					    u_xlat0.xy = u_xlat16_1.xy * _SecondaryRefractionTex_ST.xx;
					    u_xlat1.xz = u_xlat16_1.zw * vec2(0.0199999996, 0.0199999996);
					    u_xlat0.xy = u_xlat0.xy * vec2(9.99999975e-06, 9.99999975e-06) + vs_TEXCOORD5.xy;
					    u_xlat16_0.xyw = texture(_SecondaryRefractionTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_0.xyw * vec3(_refractionsWetness);
					    u_xlat16_3.xyz = (-u_xlat16_0.xyw) * vec3(_refractionsWetness) + _ShallowWaterTint.xyz;
					    u_xlat16_0.xyw = texture(_WaterMap, vs_TEXCOORD1.xy).xyw;
					    u_xlat16_24 = u_xlat16_0.w * 0.5;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = vec3(_DeepWaterTint.x, _DeepWaterTint.y, _DeepWaterTint.z) + (-_ShallowWaterTint.xyz);
					    u_xlat16_25 = u_xlat16_0.x * _WaterAttenuation;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
					#else
					    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
					#endif
					    u_xlat16_5.x = u_xlat16_0.y * _EdgeFoamStrength;
					    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
					#else
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					#endif
					    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _ShallowWaterTint.xyz;
					    u_xlat16_24 = max(u_xlat16_24, u_xlat16_25);
					    u_xlat16_24 = u_xlat16_24 * 0.800000012;
					    u_xlat16_24 = min(u_xlat16_24, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_24 = dot(vs_COLOR0.xyz, vs_COLOR0.xyz);
					    u_xlat16_24 = inversesqrt(u_xlat16_24);
					    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_COLOR0.xyz;
					    u_xlat1.y = 1.0;
					    u_xlat16_24 = dot((-u_xlat16_4.xyz), u_xlat1.xyz);
					    u_xlat16_24 = u_xlat16_24 + u_xlat16_24;
					    u_xlat16_12.xyz = u_xlat1.xyz * (-vec3(u_xlat16_24)) + (-u_xlat16_4.xyz);
					    u_xlat16_0.xyw = texture(_Cube, u_xlat16_12.xyz).xyz;
					    u_xlat16_12.xyz = (-u_xlat16_3.xyz) + u_xlat16_0.xyw;
					    u_xlat16_24 = dot(u_xlat1.xyz, u_xlat16_4.xyz);
					    u_xlat16_25 = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
					    u_xlat16_25 = max(u_xlat16_25, 0.0);
					    u_xlat16_6 = (-u_xlat16_24) + 0.5;
					    u_xlat16_24 = max(u_xlat16_24, 0.0);
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_25 = max(u_xlat16_6, 0.0);
					    u_xlat16_6 = min(u_xlat16_25, _Reflectivity);
					    u_xlat16_3.xyz = vec3(u_xlat16_6) * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_12.xyz = u_xlat16_0.zzz + (-u_xlat16_3.xyz);
					    u_xlat16_3.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = texture(_AnisoMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.y = dot(u_xlat16_4.xyz, u_xlat16_0.xyz);
					    u_xlat16_4.x = dot(u_xlat16_4.xyz, (-vs_TEXCOORD2.xyz));
					    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xy = u_xlat16_5.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(0.5, 0.5);
					    u_xlat16_0.x = texture(_AnisoMap, u_xlat0.xy).w;
					    u_xlat16_11 = u_xlat16_0.x * _Gloss;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_11;
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<u_xlat16_4.x; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<u_xlat16_4.x) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat16_4.x<0.0; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati7 = int((u_xlat16_4.x<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati7;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = _LightColor0.x * 0.5;
					    u_xlat16_24 = u_xlat0.x * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_25 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
					    u_xlat16_24 = u_xlat16_24 * 10.0;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz + vec3(u_xlat16_24);
					    SV_Target0.xyz = u_xlat16_3.xyz + glstate_lightmodel_ambient.xyz;
					    SV_Target0.w = _Opaqueness;
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
			}
		}
	}
	Fallback "Mobile/VertexLit"
}