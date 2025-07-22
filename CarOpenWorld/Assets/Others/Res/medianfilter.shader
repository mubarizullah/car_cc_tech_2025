Shader "Hidden/DepthOfField/MedianFilter" {
	Properties {
		_MainTex ("-", 2D) = "black" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 40354
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#if !defined(GL_EXT_shader_texture_lod)
					#define texture1DLodEXT texture1D
					#define texture2DLodEXT texture2D
					#define texture2DProjLodEXT texture2DProj
					#define texture3DLodEXT texture3D
					#define textureCubeLodEXT textureCube
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform 	vec4 _Offsets;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_18;
					void main()
					{
					    u_xlat0.xy = (-_Offsets.xy) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
					    u_xlat1.xy = _Offsets.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
					    u_xlat10_2 = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_3.xyz = max(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_4.xyz = min(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat10_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_18 = u_xlat10_2.w * u_xlat10_2.w;
					    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.xyz = u_xlat16_3.xyz;
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
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#if !defined(GL_EXT_shader_texture_lod)
					#define texture1DLodEXT texture1D
					#define texture2DLodEXT texture2D
					#define texture2DProjLodEXT texture2DProj
					#define texture3DLodEXT texture3D
					#define textureCubeLodEXT textureCube
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform 	vec4 _Offsets;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_18;
					void main()
					{
					    u_xlat0.xy = (-_Offsets.xy) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
					    u_xlat1.xy = _Offsets.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
					    u_xlat10_2 = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_3.xyz = max(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_4.xyz = min(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat10_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_18 = u_xlat10_2.w * u_xlat10_2.w;
					    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.xyz = u_xlat16_3.xyz;
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
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#if !defined(GL_EXT_shader_texture_lod)
					#define texture1DLodEXT texture1D
					#define texture2DLodEXT texture2D
					#define texture2DProjLodEXT texture2DProj
					#define texture3DLodEXT texture3D
					#define textureCubeLodEXT textureCube
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform 	vec4 _Offsets;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_18;
					void main()
					{
					    u_xlat0.xy = (-_Offsets.xy) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
					    u_xlat1.xy = _Offsets.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
					    u_xlat10_2 = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_3.xyz = max(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_4.xyz = min(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat10_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_18 = u_xlat10_2.w * u_xlat10_2.w;
					    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.xyz = u_xlat16_3.xyz;
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
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform 	vec4 _Offsets;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_18;
					void main()
					{
					    u_xlat0.xy = (-_Offsets.xy) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
					    u_xlat1.xy = _Offsets.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
					    u_xlat16_2 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_3.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_18 = u_xlat16_2.w * u_xlat16_2.w;
					    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat16_2.w;
					    SV_Target0.xyz = u_xlat16_3.xyz;
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
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform 	vec4 _Offsets;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_18;
					void main()
					{
					    u_xlat0.xy = (-_Offsets.xy) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
					    u_xlat1.xy = _Offsets.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
					    u_xlat16_2 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_3.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_18 = u_xlat16_2.w * u_xlat16_2.w;
					    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat16_2.w;
					    SV_Target0.xyz = u_xlat16_3.xyz;
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
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform 	vec4 _Offsets;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_18;
					void main()
					{
					    u_xlat0.xy = (-_Offsets.xy) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
					    u_xlat1.xy = _Offsets.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
					    u_xlat16_2 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_3.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_18 = u_xlat16_2.w * u_xlat16_2.w;
					    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat16_2.w;
					    SV_Target0.xyz = u_xlat16_3.xyz;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 106808
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#if !defined(GL_EXT_shader_texture_lod)
					#define texture1DLodEXT texture1D
					#define texture2DLodEXT texture2D
					#define texture2DProjLodEXT texture2DProj
					#define texture3DLodEXT texture3D
					#define textureCubeLodEXT textureCube
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					mediump vec3 u_xlat16_9;
					mediump vec3 u_xlat16_10;
					mediump float u_xlat16_33;
					void main()
					{
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat10_4.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0.xyz = min(u_xlat10_1.xyz, u_xlat10_3.xyz);
					    u_xlat16_5.xyz = max(u_xlat10_1.xyz, u_xlat10_3.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = min(u_xlat10_4.xyz, u_xlat10_1.xyz);
					    u_xlat16_7.xyz = max(u_xlat10_4.xyz, u_xlat10_1.xyz);
					    u_xlat10_1 = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_8.xyz = min(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_9.xyz = max(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_10.xyz = min(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_10.xyz);
					    u_xlat16_8.xyz = min(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_7.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_2.xy, 0.0).xyz;
					    u_xlat10_4.xyz = texture2DLodEXT(_MainTex, u_xlat16_2.zw, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat10_3.xyz, u_xlat16_6.xyz);
					    u_xlat16_8.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_7.xyz = max(u_xlat10_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat10_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_0.xyz, u_xlat10_3.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat10_3.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = (-u_xlat10_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_33 = u_xlat10_1.w * u_xlat10_1.w;
					    u_xlat16_0.xyz = vec3(u_xlat16_33) * u_xlat16_0.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat16_0.xyz;
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
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#if !defined(GL_EXT_shader_texture_lod)
					#define texture1DLodEXT texture1D
					#define texture2DLodEXT texture2D
					#define texture2DProjLodEXT texture2DProj
					#define texture3DLodEXT texture3D
					#define textureCubeLodEXT textureCube
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					mediump vec3 u_xlat16_9;
					mediump vec3 u_xlat16_10;
					mediump float u_xlat16_33;
					void main()
					{
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat10_4.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0.xyz = min(u_xlat10_1.xyz, u_xlat10_3.xyz);
					    u_xlat16_5.xyz = max(u_xlat10_1.xyz, u_xlat10_3.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = min(u_xlat10_4.xyz, u_xlat10_1.xyz);
					    u_xlat16_7.xyz = max(u_xlat10_4.xyz, u_xlat10_1.xyz);
					    u_xlat10_1 = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_8.xyz = min(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_9.xyz = max(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_10.xyz = min(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_10.xyz);
					    u_xlat16_8.xyz = min(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_7.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_2.xy, 0.0).xyz;
					    u_xlat10_4.xyz = texture2DLodEXT(_MainTex, u_xlat16_2.zw, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat10_3.xyz, u_xlat16_6.xyz);
					    u_xlat16_8.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_7.xyz = max(u_xlat10_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat10_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_0.xyz, u_xlat10_3.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat10_3.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = (-u_xlat10_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_33 = u_xlat10_1.w * u_xlat10_1.w;
					    u_xlat16_0.xyz = vec3(u_xlat16_33) * u_xlat16_0.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat16_0.xyz;
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
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#if !defined(GL_EXT_shader_texture_lod)
					#define texture1DLodEXT texture1D
					#define texture2DLodEXT texture2D
					#define texture2DProjLodEXT texture2DProj
					#define texture3DLodEXT texture3D
					#define textureCubeLodEXT textureCube
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					mediump vec3 u_xlat16_9;
					mediump vec3 u_xlat16_10;
					mediump float u_xlat16_33;
					void main()
					{
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat10_4.xyz = texture2DLodEXT(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0.xyz = min(u_xlat10_1.xyz, u_xlat10_3.xyz);
					    u_xlat16_5.xyz = max(u_xlat10_1.xyz, u_xlat10_3.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = min(u_xlat10_4.xyz, u_xlat10_1.xyz);
					    u_xlat16_7.xyz = max(u_xlat10_4.xyz, u_xlat10_1.xyz);
					    u_xlat10_1 = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_8.xyz = min(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_9.xyz = max(u_xlat10_1.xyz, u_xlat10_2.xyz);
					    u_xlat16_10.xyz = min(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_10.xyz);
					    u_xlat16_8.xyz = min(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_7.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_2.xy, 0.0).xyz;
					    u_xlat10_4.xyz = texture2DLodEXT(_MainTex, u_xlat16_2.zw, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat10_3.xyz, u_xlat16_6.xyz);
					    u_xlat16_8.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_7.xyz = max(u_xlat10_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat10_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_0.xyz, u_xlat10_3.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat10_3.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = (-u_xlat10_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_33 = u_xlat10_1.w * u_xlat10_1.w;
					    u_xlat16_0.xyz = vec3(u_xlat16_33) * u_xlat16_0.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat16_0.xyz;
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
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					mediump vec3 u_xlat16_9;
					mediump vec3 u_xlat16_10;
					mediump float u_xlat16_33;
					void main()
					{
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat16_4.xyz = textureLod(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = min(u_xlat16_4.xyz, u_xlat16_1.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_4.xyz, u_xlat16_1.xyz);
					    u_xlat16_1 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_8.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_9.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_10.xyz = min(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_10.xyz);
					    u_xlat16_8.xyz = min(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_7.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_2.xy, 0.0).xyz;
					    u_xlat16_4.xyz = textureLod(_MainTex, u_xlat16_2.zw, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_3.xyz, u_xlat16_6.xyz);
					    u_xlat16_8.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_33 = u_xlat16_1.w * u_xlat16_1.w;
					    u_xlat16_0.xyz = vec3(u_xlat16_33) * u_xlat16_0.xyz + u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_0.xyz;
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
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					mediump vec3 u_xlat16_9;
					mediump vec3 u_xlat16_10;
					mediump float u_xlat16_33;
					void main()
					{
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat16_4.xyz = textureLod(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = min(u_xlat16_4.xyz, u_xlat16_1.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_4.xyz, u_xlat16_1.xyz);
					    u_xlat16_1 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_8.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_9.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_10.xyz = min(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_10.xyz);
					    u_xlat16_8.xyz = min(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_7.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_2.xy, 0.0).xyz;
					    u_xlat16_4.xyz = textureLod(_MainTex, u_xlat16_2.zw, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_3.xyz, u_xlat16_6.xyz);
					    u_xlat16_8.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_33 = u_xlat16_1.w * u_xlat16_1.w;
					    u_xlat16_0.xyz = vec3(u_xlat16_33) * u_xlat16_0.xyz + u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_0.xyz;
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
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					mediump vec3 u_xlat16_9;
					mediump vec3 u_xlat16_10;
					mediump float u_xlat16_33;
					void main()
					{
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_0.zw, 0.0).xyz;
					    u_xlat16_4.xyz = textureLod(_MainTex, u_xlat16_0.xy, 0.0).xyz;
					    u_xlat16_0.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = min(u_xlat16_4.xyz, u_xlat16_1.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_4.xyz, u_xlat16_1.xyz);
					    u_xlat16_1 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat16_8.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_9.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_10.xyz = min(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_6.xyz, u_xlat16_8.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_10.xyz);
					    u_xlat16_8.xyz = min(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_9.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_7.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_2.xy, 0.0).xyz;
					    u_xlat16_4.xyz = textureLod(_MainTex, u_xlat16_2.zw, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_3.xyz, u_xlat16_6.xyz);
					    u_xlat16_8.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_8.xyz);
					    u_xlat16_6.xyz = max(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_7.xyz, u_xlat16_0.xyz);
					    u_xlat16_7.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_6.xyz, u_xlat16_7.xyz);
					    u_xlat16_6.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat16_6.xy, 0.0).xyz;
					    u_xlat16_6.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_3.xyz);
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_33 = u_xlat16_1.w * u_xlat16_1.w;
					    u_xlat16_0.xyz = vec3(u_xlat16_33) * u_xlat16_0.xyz + u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_1.w;
					    SV_Target0.xyz = u_xlat16_0.xyz;
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