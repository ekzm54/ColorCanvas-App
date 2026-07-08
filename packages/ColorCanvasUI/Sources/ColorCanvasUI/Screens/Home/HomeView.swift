import ColorCanvasApplication
import ColorCanvasDesignSystem
import SwiftUI

public struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    public init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        content
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .task { await viewModel.load() }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            LoadingStateView(message: "Loading your projects…")
        case .empty:
            EmptyStateView(
                title: "Welcome to ColorCanvas",
                message: "Pick a template below to start your first project.",
                systemImageName: "paintpalette"
            )
        case .error(let error):
            ErrorStateView(
                title: "Something Went Wrong",
                message: viewModel.errorMessage(for: error),
                retryAction: { viewModel.retryTapped() }
            )
        case .ready(let data):
            homeContent(data)
        }
    }

    @ViewBuilder
    private func homeContent(_ data: HomeViewData) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignTokens.Space.xl) {
                header
                if let continueProject = data.continueProject {
                    ContinueProjectCard(project: continueProject) {
                        viewModel.continueProjectTapped(continueProject)
                    }
                }
                if !data.featuredTemplates.isEmpty {
                    FeaturedTemplateSection(templates: data.featuredTemplates) { template in
                        viewModel.templateTapped(template)
                    }
                }
                if !data.categories.isEmpty {
                    CategorySection(categories: data.categories) { category in
                        viewModel.categoryTapped(category)
                    }
                }
                if !data.recentProjects.isEmpty {
                    RecentProjectsSection(projects: data.recentProjects) { project in
                        viewModel.recentProjectTapped(project)
                    }
                }
            }
            .padding(DesignTokens.Space.lg)
        }
        .background(DesignTokens.Color.background)
    }

    @ViewBuilder
    private var header: some View {
        if dynamicTypeSize.isAccessibilitySize {
            VStack(alignment: .leading, spacing: DesignTokens.Space.sm) {
                headerTitle
                HStack(spacing: DesignTokens.Space.sm) {
                    Spacer()
                    searchButton
                    settingsButton
                }
            }
        } else {
            HStack {
                headerTitle
                Spacer()
                searchButton
                settingsButton
            }
        }
    }

    private var headerTitle: some View {
        Text("ColorCanvas")
            .font(DesignTokens.Typography.largeTitle)
            .foregroundStyle(DesignTokens.Color.textPrimary)
    }

    private var searchButton: some View {
        IconButton(systemImageName: "magnifyingglass", accessibilityLabel: "Search") {
            viewModel.searchTapped()
        }
    }

    private var settingsButton: some View {
        IconButton(systemImageName: "gearshape", accessibilityLabel: "Settings") {
            viewModel.settingsTapped()
        }
    }
}
