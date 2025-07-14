Shader "Time of Day/Sun" {
	Properties {
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Background+30" "RenderType" = "Background" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Background+30" "RenderType" = "Background" }
			Blend One One, One One
			ZWrite Off
			Fog {
				Mode Off
			}
			GpuProgramID 49452
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_SunMeshColor;
					uniform 	float TOD_SunMeshContrast;
					uniform 	float TOD_SunMeshBrightness;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					float u_xlat1;
					mediump float u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_1 = log2(u_xlat16_0);
					    u_xlatb3 = 0.5>=u_xlat16_0;
					    u_xlat3 = u_xlatb3 ? TOD_SunMeshBrightness : float(0.0);
					    u_xlat1 = u_xlat16_1 * TOD_SunMeshContrast;
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + 1.0;
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat5 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat5;
					    u_xlat5 = TOD_SunMeshBrightness;
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat16_0 = u_xlat1 * u_xlat5 + u_xlat3;
					    u_xlat16_2 = vs_TEXCOORD0.z;
					    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_2;
					    SV_Target0.xyz = vec3(u_xlat16_0) * TOD_SunMeshColor.xyz;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_SunMeshColor;
					uniform 	float TOD_SunMeshContrast;
					uniform 	float TOD_SunMeshBrightness;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					float u_xlat1;
					mediump float u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_1 = log2(u_xlat16_0);
					    u_xlatb3 = 0.5>=u_xlat16_0;
					    u_xlat3 = u_xlatb3 ? TOD_SunMeshBrightness : float(0.0);
					    u_xlat1 = u_xlat16_1 * TOD_SunMeshContrast;
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + 1.0;
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat5 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat5;
					    u_xlat5 = TOD_SunMeshBrightness;
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat16_0 = u_xlat1 * u_xlat5 + u_xlat3;
					    u_xlat16_2 = vs_TEXCOORD0.z;
					    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_2;
					    SV_Target0.xyz = vec3(u_xlat16_0) * TOD_SunMeshColor.xyz;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_SunMeshColor;
					uniform 	float TOD_SunMeshContrast;
					uniform 	float TOD_SunMeshBrightness;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					float u_xlat1;
					mediump float u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_1 = log2(u_xlat16_0);
					    u_xlatb3 = 0.5>=u_xlat16_0;
					    u_xlat3 = u_xlatb3 ? TOD_SunMeshBrightness : float(0.0);
					    u_xlat1 = u_xlat16_1 * TOD_SunMeshContrast;
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + 1.0;
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat5 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat5;
					    u_xlat5 = TOD_SunMeshBrightness;
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat16_0 = u_xlat1 * u_xlat5 + u_xlat3;
					    u_xlat16_2 = vs_TEXCOORD0.z;
					    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_2;
					    SV_Target0.xyz = vec3(u_xlat16_0) * TOD_SunMeshColor.xyz;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_SunMeshColor;
					uniform 	float TOD_SunMeshContrast;
					uniform 	float TOD_SunMeshBrightness;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					float u_xlat1;
					mediump float u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_1 = log2(u_xlat16_0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.5>=u_xlat16_0);
					#else
					    u_xlatb3 = 0.5>=u_xlat16_0;
					#endif
					    u_xlat3 = u_xlatb3 ? TOD_SunMeshBrightness : float(0.0);
					    u_xlat1 = u_xlat16_1 * TOD_SunMeshContrast;
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + 1.0;
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat5 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat5;
					    u_xlat5 = TOD_SunMeshBrightness;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
					#else
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat1 * u_xlat5 + u_xlat3;
					    u_xlat16_2 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
					#else
					    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_2;
					    SV_Target0.xyz = vec3(u_xlat16_0) * TOD_SunMeshColor.xyz;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_SunMeshColor;
					uniform 	float TOD_SunMeshContrast;
					uniform 	float TOD_SunMeshBrightness;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					float u_xlat1;
					mediump float u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_1 = log2(u_xlat16_0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.5>=u_xlat16_0);
					#else
					    u_xlatb3 = 0.5>=u_xlat16_0;
					#endif
					    u_xlat3 = u_xlatb3 ? TOD_SunMeshBrightness : float(0.0);
					    u_xlat1 = u_xlat16_1 * TOD_SunMeshContrast;
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + 1.0;
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat5 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat5;
					    u_xlat5 = TOD_SunMeshBrightness;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
					#else
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat1 * u_xlat5 + u_xlat3;
					    u_xlat16_2 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
					#else
					    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_2;
					    SV_Target0.xyz = vec3(u_xlat16_0) * TOD_SunMeshColor.xyz;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_SunMeshColor;
					uniform 	float TOD_SunMeshContrast;
					uniform 	float TOD_SunMeshBrightness;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					float u_xlat1;
					mediump float u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_1 = log2(u_xlat16_0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.5>=u_xlat16_0);
					#else
					    u_xlatb3 = 0.5>=u_xlat16_0;
					#endif
					    u_xlat3 = u_xlatb3 ? TOD_SunMeshBrightness : float(0.0);
					    u_xlat1 = u_xlat16_1 * TOD_SunMeshContrast;
					    u_xlat1 = exp2(u_xlat1);
					    u_xlat1 = (-u_xlat1) + 1.0;
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat5 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat5;
					    u_xlat5 = TOD_SunMeshBrightness;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
					#else
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat1 * u_xlat5 + u_xlat3;
					    u_xlat16_2 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
					#else
					    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_2;
					    SV_Target0.xyz = vec3(u_xlat16_0) * TOD_SunMeshColor.xyz;
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
			}
		}
	}
}