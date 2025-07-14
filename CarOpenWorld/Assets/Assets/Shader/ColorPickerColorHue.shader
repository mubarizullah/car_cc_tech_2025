Shader "ColorPicker/ColorHue" {
	Properties {
	}
	SubShader {
		Pass {
			GpuProgramID 37010
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
					varying highp vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					bvec4 u_xlatb1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec4 u_xlat16_4;
					bvec2 u_xlatb5;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.x * 6.0;
					    u_xlat0 = floor(u_xlat0);
					    u_xlatb5.xy = equal(vec4(u_xlat0), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    u_xlat15 = vs_TEXCOORD0.x * 6.0 + (-u_xlat0);
					    u_xlatb1 = equal(vec4(u_xlat0), vec4(0.0, 1.0, 2.0, 3.0));
					    u_xlat16_2.x = (-u_xlat15) + 1.0;
					    u_xlat16_2.y = float(1.0);
					    u_xlat16_2.z = float(0.0);
					    u_xlat16_2.w = float(1.0);
					    u_xlat16_3.xyz = (u_xlatb5.y) ? u_xlat16_2.zxw : vec3(0.0, 0.0, 1.0);
					    u_xlat16_4.x = (u_xlatb5.x) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.yzw = (u_xlatb5.x) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyz;
					    u_xlat16_3 = (u_xlatb1.w) ? u_xlat16_2.zxww : u_xlat16_4;
					    u_xlat16_4.z = (u_xlatb1.z) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.xyw = (u_xlatb1.z) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyw;
					    u_xlat16_2 = (u_xlatb1.y) ? u_xlat16_2 : u_xlat16_4;
					    SV_Target0.y = (u_xlatb1.x) ? u_xlat15 : u_xlat16_2.y;
					    SV_Target0.xzw = (u_xlatb1.x) ? vec3(1.0, 0.0, 1.0) : u_xlat16_2.xzw;
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
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
					varying highp vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					bvec4 u_xlatb1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec4 u_xlat16_4;
					bvec2 u_xlatb5;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.x * 6.0;
					    u_xlat0 = floor(u_xlat0);
					    u_xlatb5.xy = equal(vec4(u_xlat0), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    u_xlat15 = vs_TEXCOORD0.x * 6.0 + (-u_xlat0);
					    u_xlatb1 = equal(vec4(u_xlat0), vec4(0.0, 1.0, 2.0, 3.0));
					    u_xlat16_2.x = (-u_xlat15) + 1.0;
					    u_xlat16_2.y = float(1.0);
					    u_xlat16_2.z = float(0.0);
					    u_xlat16_2.w = float(1.0);
					    u_xlat16_3.xyz = (u_xlatb5.y) ? u_xlat16_2.zxw : vec3(0.0, 0.0, 1.0);
					    u_xlat16_4.x = (u_xlatb5.x) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.yzw = (u_xlatb5.x) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyz;
					    u_xlat16_3 = (u_xlatb1.w) ? u_xlat16_2.zxww : u_xlat16_4;
					    u_xlat16_4.z = (u_xlatb1.z) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.xyw = (u_xlatb1.z) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyw;
					    u_xlat16_2 = (u_xlatb1.y) ? u_xlat16_2 : u_xlat16_4;
					    SV_Target0.y = (u_xlatb1.x) ? u_xlat15 : u_xlat16_2.y;
					    SV_Target0.xzw = (u_xlatb1.x) ? vec3(1.0, 0.0, 1.0) : u_xlat16_2.xzw;
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
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
					varying highp vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					bvec4 u_xlatb1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec4 u_xlat16_4;
					bvec2 u_xlatb5;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.x * 6.0;
					    u_xlat0 = floor(u_xlat0);
					    u_xlatb5.xy = equal(vec4(u_xlat0), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    u_xlat15 = vs_TEXCOORD0.x * 6.0 + (-u_xlat0);
					    u_xlatb1 = equal(vec4(u_xlat0), vec4(0.0, 1.0, 2.0, 3.0));
					    u_xlat16_2.x = (-u_xlat15) + 1.0;
					    u_xlat16_2.y = float(1.0);
					    u_xlat16_2.z = float(0.0);
					    u_xlat16_2.w = float(1.0);
					    u_xlat16_3.xyz = (u_xlatb5.y) ? u_xlat16_2.zxw : vec3(0.0, 0.0, 1.0);
					    u_xlat16_4.x = (u_xlatb5.x) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.yzw = (u_xlatb5.x) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyz;
					    u_xlat16_3 = (u_xlatb1.w) ? u_xlat16_2.zxww : u_xlat16_4;
					    u_xlat16_4.z = (u_xlatb1.z) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.xyw = (u_xlatb1.z) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyw;
					    u_xlat16_2 = (u_xlatb1.y) ? u_xlat16_2 : u_xlat16_4;
					    SV_Target0.y = (u_xlatb1.x) ? u_xlat15 : u_xlat16_2.y;
					    SV_Target0.xzw = (u_xlatb1.x) ? vec3(1.0, 0.0, 1.0) : u_xlat16_2.xzw;
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
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					bvec4 u_xlatb1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec4 u_xlat16_4;
					bvec2 u_xlatb5;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.x * 6.0;
					    u_xlat0 = floor(u_xlat0);
					    u_xlatb5.xy = equal(vec4(u_xlat0), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    u_xlat15 = vs_TEXCOORD0.x * 6.0 + (-u_xlat0);
					    u_xlatb1 = equal(vec4(u_xlat0), vec4(0.0, 1.0, 2.0, 3.0));
					    u_xlat16_2.x = (-u_xlat15) + 1.0;
					    u_xlat16_2.y = float(1.0);
					    u_xlat16_2.z = float(0.0);
					    u_xlat16_2.w = float(1.0);
					    u_xlat16_3.xyz = (u_xlatb5.y) ? u_xlat16_2.zxw : vec3(0.0, 0.0, 1.0);
					    u_xlat16_4.x = (u_xlatb5.x) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.yzw = (u_xlatb5.x) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyz;
					    u_xlat16_3 = (u_xlatb1.w) ? u_xlat16_2.zxww : u_xlat16_4;
					    u_xlat16_4.z = (u_xlatb1.z) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.xyw = (u_xlatb1.z) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyw;
					    u_xlat16_2 = (u_xlatb1.y) ? u_xlat16_2 : u_xlat16_4;
					    SV_Target0.y = (u_xlatb1.x) ? u_xlat15 : u_xlat16_2.y;
					    SV_Target0.xzw = (u_xlatb1.x) ? vec3(1.0, 0.0, 1.0) : u_xlat16_2.xzw;
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
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					bvec4 u_xlatb1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec4 u_xlat16_4;
					bvec2 u_xlatb5;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.x * 6.0;
					    u_xlat0 = floor(u_xlat0);
					    u_xlatb5.xy = equal(vec4(u_xlat0), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    u_xlat15 = vs_TEXCOORD0.x * 6.0 + (-u_xlat0);
					    u_xlatb1 = equal(vec4(u_xlat0), vec4(0.0, 1.0, 2.0, 3.0));
					    u_xlat16_2.x = (-u_xlat15) + 1.0;
					    u_xlat16_2.y = float(1.0);
					    u_xlat16_2.z = float(0.0);
					    u_xlat16_2.w = float(1.0);
					    u_xlat16_3.xyz = (u_xlatb5.y) ? u_xlat16_2.zxw : vec3(0.0, 0.0, 1.0);
					    u_xlat16_4.x = (u_xlatb5.x) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.yzw = (u_xlatb5.x) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyz;
					    u_xlat16_3 = (u_xlatb1.w) ? u_xlat16_2.zxww : u_xlat16_4;
					    u_xlat16_4.z = (u_xlatb1.z) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.xyw = (u_xlatb1.z) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyw;
					    u_xlat16_2 = (u_xlatb1.y) ? u_xlat16_2 : u_xlat16_4;
					    SV_Target0.y = (u_xlatb1.x) ? u_xlat15 : u_xlat16_2.y;
					    SV_Target0.xzw = (u_xlatb1.x) ? vec3(1.0, 0.0, 1.0) : u_xlat16_2.xzw;
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
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					bvec4 u_xlatb1;
					mediump vec4 u_xlat16_2;
					mediump vec4 u_xlat16_3;
					mediump vec4 u_xlat16_4;
					bvec2 u_xlatb5;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.x * 6.0;
					    u_xlat0 = floor(u_xlat0);
					    u_xlatb5.xy = equal(vec4(u_xlat0), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    u_xlat15 = vs_TEXCOORD0.x * 6.0 + (-u_xlat0);
					    u_xlatb1 = equal(vec4(u_xlat0), vec4(0.0, 1.0, 2.0, 3.0));
					    u_xlat16_2.x = (-u_xlat15) + 1.0;
					    u_xlat16_2.y = float(1.0);
					    u_xlat16_2.z = float(0.0);
					    u_xlat16_2.w = float(1.0);
					    u_xlat16_3.xyz = (u_xlatb5.y) ? u_xlat16_2.zxw : vec3(0.0, 0.0, 1.0);
					    u_xlat16_4.x = (u_xlatb5.x) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.yzw = (u_xlatb5.x) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyz;
					    u_xlat16_3 = (u_xlatb1.w) ? u_xlat16_2.zxww : u_xlat16_4;
					    u_xlat16_4.z = (u_xlatb1.z) ? u_xlat15 : u_xlat16_3.z;
					    u_xlat16_4.xyw = (u_xlatb1.z) ? vec3(0.0, 1.0, 1.0) : u_xlat16_3.xyw;
					    u_xlat16_2 = (u_xlatb1.y) ? u_xlat16_2 : u_xlat16_4;
					    SV_Target0.y = (u_xlatb1.x) ? u_xlat15 : u_xlat16_2.y;
					    SV_Target0.xzw = (u_xlatb1.x) ? vec3(1.0, 0.0, 1.0) : u_xlat16_2.xzw;
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